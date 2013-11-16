require 'rubygems'
require 'bundler'
Bundler.require

require 'httparty'
require 'json'
require 'instagram'
require 'rdio_api'
require 'octokit'

desc 'Update all of the things'
task :update => [:'update:instagram', :'update:blog', :'update:rdio', :'update:github']

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
    response = HTTParty.get('https://roon.io/api/v1/blogs/sam/posts?limit=1')
    post = JSON(response.body).first

    %w{title excerpt_html url}.each do |key|
      redis.hset 'latest_post', key, post[key]
    end

    puts "Done! Cached `#{post['title']}`"
  end

  desc 'Get my heavy rotation'
  task :rdio do
    client = RdioApi.new(consumer_key: ENV['RDIO_CONSUMER_KEY'], consumer_secret: ENV['RDIO_CONSUMER_SECRET'])
    rotation = client.getHeavyRotation(type: 'albums', user: ENV['RDIO_USER_KEY'])[0...4]
    rotation.each do |album|
      %w{baseIcon releaseDate duration isClean shortUrl canStream embedUrl type price key canSample hits isExplicit artistKey length trackKeys canTether displayDate}. each do |key|
        album.delete key
      end

      album.url = "http://rdio.com#{album.url}"
      album.icon.gsub!('-200.jpg', '-400.jpg')
      album.artist_url = "http://rdio.com#{album.artistUrl}"
      album.delete 'artistUrl'
    end

    redis['rdio_heavy_rotation'] = JSON(rotation)
    puts 'Done! Cached Rdio albums.'
  end

  desc 'Get my libraries from GitHub'
  task :github do
    Octokit.auto_paginate = true
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    repos = client.repositories('soffes')

    gems = []
    pods = []

    repos.each do |repo|
      next if repo.fork? || (repo.language != 'Ruby' && repo.language != 'Objective-C')

      contents = client.contents(repo.full_name)
      files = contents.collect(&:name)
      lib = {
        id: repo.id,
        repo: repo.name,
        stars: repo.stars,
        forks: repo.forks,
        description: repo.description,
        url: repo.html_url,
        created_at: repo.created_at.to_i,
        pushed_at: repo.pushed_at.to_i
      }

      name = if repo.language == 'Ruby'
        next unless spec = files.grep(/\.gemspec$/).first
        lib[:name] = spec.gsub(/\.gemspec$/, '')
        gems << lib
      elsif repo.language == 'Objective-C'
        next unless spec = files.grep(/\.podspec$/).first
        lib[:name] = spec.gsub(/\.podspec$/, '')
        pods << lib
      end
    end

    gems.sort! { |a, b| b[:pushed_at] <=> a[:pushed_at] }
    pods.sort! { |a, b| b[:pushed_at] <=> a[:pushed_at] }

    redis['gems'] = JSON.dump(gems)
    redis['pods'] = JSON.dump(pods)
    puts "Done! Cached GitHub libraries. #{pods.length} Cocoa Pods and #{gems.length} Ruby Gems."
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
