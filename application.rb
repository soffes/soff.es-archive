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

  module TruncateHTMLHelpers
    def truncate_html(html, options = {})
      return '' if html.nil?

      default_options = {
        length: 256
      }

      html_string = TruncateHtml::HtmlString.new(html)
      TruncateHtml::HtmlTruncator.new(html_string, default_options.merge(options)).truncate
    end
  end

  class Application < Sinatra::Base
    helpers Sinatra::ContentFor
    helpers Soffes::NumberHelpers
    helpers Soffes::TruncateHTMLHelpers

    # Homepage
    get '/' do
      begin
        @latest_post = $redis.hgetall('latest_post')
        @instagram_posts = JSON($redis['instagram'])
      rescue
      end

      erb :home
    end

    # Projects
    get '/projects' do
      @pods = JSON($redis['pods'])
      @gems = JSON($redis['gems'])

      erb :projects
    end

    # Static Pages
    %w{about music drone}.each do |page|
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

    get '/clock' do
      redirect 'https://github.com/soffes/clock-saver'
    end

    # Redirect blog
    get '/blog' do
      redirect 'http://blog.soff.es'
    end

    # Redirect posts to blog
    get %r{/([\w\d\-]+)$} do |key|
      # TODO: Maybe hit an API occasionally to get allowed keys
      # and then 404 if it's not a blog post I've written.
      redirect "http://blog.soff.es/#{key}"
    end
  end
end
