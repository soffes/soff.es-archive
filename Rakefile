require 'bundler'
Bundler.require

require 'httparty'
require 'json'
require 'open-uri'
require 'nori'

desc 'Update all of the things'
task :update => [:'update:instagram', :'update:blog']

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
    doc = Nori.new.parse(open('https://blog.soff.es/rss').read)
    post = doc['rss']['channel']['item'].first

    redis.hset 'latest_post', 'title', post['title']
    redis.hset 'latest_post', 'excerpt_html', post['description']
    redis.hset 'latest_post', 'url', post['link']

    puts "Done! Cached `#{post['title']}`"
  end
end

private

def redis
  @_redis ||= begin
    uri = URI.parse(ENV['REDIS_URL'] || 'redis://localhost:6379')
    Redis.new(host: uri.host, port: uri.port, password: uri.password)
  end
end
