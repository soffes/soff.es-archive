module Soffes
  class Application < Sinatra::Application
    get '/' do
      erb :home
    end

  private

    def redis
      Soffes.redis
    end
  end
end
