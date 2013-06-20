require 'rubygems'
require 'bundler'
Bundler.require
require 'httparty'
require 'json'

desc 'Store my latest post in Redis'
task :update_post do
  response = HTTParty.get('https://roon.io/api/v1/blogs/sam/posts?limit=1')
  post = JSON(response.body).first

  %w{title excerpt_html url}.each do |key|
    redis.hset 'latest_post', key, post[key]
  end

  puts "Done! Cached `#{post['title']}`"
end

def redis
  @redis ||= if ENV['REDISTOGO_URL']
    uri = URI.parse(ENV['REDISTOGO_URL'])
    Redis.new(host: uri.host, port: uri.port, password: uri.password)
  else
    Redis.new
  end
end
