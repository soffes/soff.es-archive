require 'soffes/application'
require 'soffes/markdown_renderer'

module Soffes
  def self.redis
    $redis ||= if ENV['REDISTOGO_URL'] && ENV['REDISTOGO_URL'].length > 0
      require 'uri'
      uri = URI.parse(ENV['REDISTOGO_URL'])
      Redis.new(host: uri.host, port: uri.port, password: uri.password)
    else
      Redis.new
    end
  end
end
