require 'sinatra'
require 'redis'

module Soffes
  class Application < Sinatra::Application
    get '/' do
      slugs = []
      Soffes.redis.zrevrange('sorted-slugs', 0, 3).each do |key|
        slugs << Soffes.redis.hgetall("slug-#{key}")
      end
      erb :index, locals: { slugs: slugs }
    end

    get '/:slug' do
      slug = Soffes.redis.hgetall("slug-#{params[:slug]}")
      return erb :not_found unless slug && slug.length > 0

      erb :slug, locals: { slug: slug }
    end
  end
end
