require 'sinatra'
require 'redis'

module Soffes
  class Application < Sinatra::Application
    PAGE_SIZE = 3

    get %r{/(\d+)?} do |page|
      # Pagination
      page = (page || 1).to_i
      start_index = (page - 1) * PAGE_SIZE
      total_pages = (Soffes.redis.zcard('sorted-slugs').to_f / PAGE_SIZE.to_f).ceil.to_i

      slugs = []
      Soffes.redis.zrevrange('sorted-slugs', start_index, start_index + PAGE_SIZE - 1).each do |key|
        slugs << Soffes.redis.hgetall("slug-#{key}")
      end
      erb :index, locals: { slugs: slugs, page: page, total_pages: total_pages, window: 2 }
    end

    get '/:slug' do
      slug = Soffes.redis.hgetall("slug-#{params[:slug]}")
      return erb :not_found unless slug && slug.length > 0

      erb :slug, locals: { slug: slug }
    end
  end
end
