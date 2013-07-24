require 'sinatra/content_for'
require 'json'

# Connect to Redis
if ENV['REDISTOGO_URL']
  uri = URI.parse(ENV['REDISTOGO_URL'])
  $redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
else
  $redis = Redis.new
end

class Soffes < Sinatra::Base
  helpers Sinatra::ContentFor

  # Homepage
  get '/' do
    @post = $redis.hgetall('latest_post')
    erb :home
  end

  # Static Pages
  %w{about projects music}.each do |page|
    get "/#{page}" do
      erb page.to_sym
    end
  end

  # Redirect talks to Speaker Deck
  get 'talks' do
    redirect 'http://speakerdeck.com/soffes'
  end

  # Redirect posts to Roon
  get %r{/([\w\d\-]+)$} do |key|
    # TODO: Maybe hit the Roon API occasionally to get allowed keys
    # and then 404 if it's not a blog post I've written.
    redirect "http://sam.roon.io/#{key}"
  end
end
