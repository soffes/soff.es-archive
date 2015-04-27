require 'rubygems'
require 'bundler'
Bundler.require

require 'base64'
require 'httparty'
require 'json'
require 'octokit'
require 'open-uri'
require 'nori'

desc 'Update all of the things'
task :update => [:'update:instagram', :'update:blog', :'update:github', :'update:amazon']

namespace :update do
  desc 'Get Instagram photos'
  task :instagram do
    response = HTTParty.get("https://api.instagram.com/v1/users/68907/media/recent/?access_token=#{ENV['INSTAGRAM_TOKEN']}&count=4")
    photos = JSON(response.body)['data']
    redis['instagram'] = JSON.dump(photos)
    puts 'Done! Cached Instagram photos.'
  end

  desc 'Store my latest post in Redis'
  task :blog do
    doc = Nori.new.parse(open('http://blog.soff.es/rss').read)
    post = doc['rss']['channel']['item'].first

    redis.hset 'latest_post', 'title', post['title']
    redis.hset 'latest_post', 'excerpt_html', post['description']
    redis.hset 'latest_post', 'url', post['link']

    puts "Done! Cached `#{post['title']}`"
  end

  desc 'Get my libraries from GitHub'
  task :github do
    gemspecs = JSON.load(open('https://rubygems.org/api/v1/owners/soffes/gems.json'))

    Octokit.auto_paginate = true
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    repos = client.repositories('soffes')

    gems = []
    pods = []

    repos.each do |repo|
      next if repo.private? || repo.fork? || (repo.language != 'Ruby' && repo.language != 'Objective-C')

      lib = {
        id: repo.id,
        repo: repo.name,
        stars: repo.stargazers_count,
        forks: repo.forks,
        description: repo.description,
        url: repo.rels['html'].href,
        created_at: repo.created_at.to_i,
        pushed_at: repo.pushed_at.to_i
      }

      name = if repo.language == 'Ruby'
        next unless gemspec = gemspecs.select { |spec|
          uri = spec['homepage_uri']
          uri.sub!('http://github.com', 'https://github.com')
          uri.sub!('samsoffes', 'soffes')
          uri == lib[:url]
        }.first
        lib[:name] = gemspec['name']
        lib[:downloads] = gemspec['downloads']
        lib[:version] = gemspec['version']
        gems << lib
      elsif repo.language == 'Objective-C'
        contents = client.contents(repo.full_name)
        files = contents.collect(&:name)
        next unless spec = files.grep(/\.podspec$/).first
        lib[:name] = spec.gsub(/\.podspec$/, '')
        pods << lib
      end
    end

    gems.sort! { |a, b| b[:stars] <=> a[:stars] }
    pods.sort! { |a, b| b[:stars] <=> a[:stars] }

    redis['gems'] = JSON.dump(gems)
    redis['pods'] = JSON.dump(pods)
    puts "Done! Cached GitHub libraries. #{pods.length} Cocoa Pods and #{gems.length} Ruby Gems."
  end

  desc 'Update Amazon product prices'
  task :amazon do
    item_ids = %w{B00JFBAT56 B00F3F0GLU B009QZH6JS B00J4ZYPCG B001KELVS0 B001KBZ3P0 B00EYYX9NS B00FKZZQQS B00HHICQUK B00CVQ4FFM B00I82U7YQ B00I8UCVZQ B00I3J4NG2 B00GNOMT7Y B00I4N7KBW}

    products = {}
    item_ids.each_slice(10) do |ids|
      products.merge! get_amazon_products(ids)
    end

    redis['amazon_prices'] = JSON.dump(products)
  end
end

def redis
  @redis ||= if ENV['REDISTOGO_URL']
    uri = URI.parse(ENV['REDISTOGO_URL'])
    Redis.new(host: uri.host, port: uri.port, password: uri.password)
  else
    Redis.new
  end
end

def get_amazon_products(ids)
  timestamp = Time.now.utc.iso8601
  query = "AWSAccessKeyId=#{ENV['AWS_ACCESS_KEY_ID']}&AssociateTag=#{ENV['AMAZON_ASSOCIATE_TAG']}&ItemId=#{ids.join(',')}&Operation=ItemLookup&ResponseGroup=ItemAttributes&Service=AWSECommerceService&Timestamp=#{timestamp}"
  data = ['GET', 'webservices.amazon.com', '/onca/xml', query.gsub(',', '%2C').gsub(':', '%3A')].join("\n")
  signature = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, ENV['AWS_SECRET_ACCESS_KEY'], data)
  signature = Base64.encode64(signature)

  response = HTTParty.get("http://webservices.amazon.com/onca/xml?#{query}&Signature=#{signature}")
  response = Nori.new.parse(response.body)

  if response['ItemLookupErrorResponse']
    puts "\nError: #{response['ItemLookupErrorResponse']['Error']['Message']}\n\n"
    return
  end

  items = response['ItemLookupResponse']['Items']['Item']

  products = {}
  items.each do |item|
    begin
      products[item['ASIN']] = item['ItemAttributes']['ListPrice']['FormattedPrice']
    rescue
      puts "Failed to parse: #{item}"
    end
  end

  products
end
