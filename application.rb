require 'sinatra/content_for'
require 'json'

# Connect to Redis
uri = URI.parse(ENV['REDISTOGO_URL'] || 'redis://localhost:6379')
$redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)

module Soffes
  module NumberHelpers
    def format_number(number)
      number.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    end
  end

  class Application < Sinatra::Base
    helpers Sinatra::ContentFor
    helpers Soffes::NumberHelpers

    # Homepage
    get '/' do
      @post = $redis.hgetall('latest_post')
      erb :home
    end

    # Projects
    get '/projects' do
      @pods = JSON($redis['pods'])
      @gems = JSON($redis['gems'])

      erb :projects
    end

    # Static Pages
    %w{about music}.each do |page|
      get "/#{page}" do
        erb page.to_sym
      end
    end

    # Redirect talks to Speaker Deck
    get 'talks' do
      redirect 'http://speakerdeck.com/soffes'
    end

    # Redirect resume to GitHub
    get /resume|cv/ do
      redirect 'https://github.com/soffes/resume/blob/master/Sam%20Soffes%20Resume.pdf?raw=true'
    end

    # Redirect posts to Roon
    get %r{/([\w\d\-]+)$} do |key|
      # TODO: Maybe hit the Roon API occasionally to get allowed keys
      # and then 404 if it's not a blog post I've written.
      redirect "http://sam.roon.io/#{key}"
    end
  end
end
