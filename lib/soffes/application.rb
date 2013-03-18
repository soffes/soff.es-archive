require 'sinatra'
require 'redis'

module Soffes
  class Application < Sinatra::Application
    PAGE_SIZE = 3

    get %r{/$|/(\d+)$} do |page|
      # Pagination
      page = (page || 1).to_i
      start_index = (page - 1) * PAGE_SIZE
      total_pages = (Soffes.redis.zcard('sorted-slugs').to_f / PAGE_SIZE.to_f).ceil.to_i

      keys = redis.zrevrange('sorted-slugs', start_index, start_index + PAGE_SIZE - 1)
      slugs = redis.hmget('slugs', *keys).map { |s| MultiJson.load(s) }

      erb :index, locals: { slugs: slugs, page: page, total_pages: total_pages, window: 2 }
    end

    get %r{/([\w\d\-]+)$} do |key|
      slug = redis.hget('slugs', key)
      return erb :not_found unless slug && slug.length > 0

      erb :slug, locals: { slug: MultiJson.load(slug) }
    end

  private

    def redis
      Soffes.redis
    end
  end
end
