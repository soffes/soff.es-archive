require 'sinatra'
require 'redis'

module Soffes
  class Application < Sinatra::Application
    get '/' do
      erb :home
    end

    get '/:slug' do
      @slug = Soffes.redis.hgetall("slug-#{params[:slug]}")
      @published_at = Time.at(@slug['published_at'].to_i)
      erb :slug
    end
  end
end
