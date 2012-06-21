class SamSoffes::PreferredHost
  def initialize(app, options = {})
    @app = app
    @preferred_host = (options[:host] or 'samsoff.es')
  end

  def call(env)
    request = Rack::Request.new(env)
    url = URI(request.url)
    host = url.host

    # Not the standard host
    if host != @preferred_host
      url.host = @preferred_host
      headers = { 'Location' => url.to_s }
      [301, headers, []]

    # Don't do anything
    else
      @app.call(env)
    end
  end
end
