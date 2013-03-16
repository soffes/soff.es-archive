require 'sinatra'
require 'redis'

module Soffes
  class Application < Sinatra::Application
    PAGE_SIZE = 3

    get %r{/(\d+)?} do |page|
      # TODO: This is terrible and doesn't work right
      page ||= 1
      page = page.to_i
      page -= PAGE_SIZE - 1 if page == 1

      slugs = []
      Soffes.redis.zrevrange('sorted-slugs', page + 1, page + PAGE_SIZE).each do |key|
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
