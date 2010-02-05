# Bundler
require File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))
Bundler.require_env

class SamSoffes < Sinatra::Default
  set :public, File.dirname(__FILE__) + '/_site'
 
  # This before filter ensures that your pages are only ever served 
  # once (per deploy) by Sinatra, and then by Varnish after that
  before do
    response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
  end

  not_found do
    File.read('_site/four-oh-four.html')
  end

  get '/' do
    File.read('_site/index.html')
  end

  get %r{/post/([a-zA-Z\-_]+)/?} do
    File.read("_site/post/#{params[:captures].first}/index.html") or not_found
  end

  get %r{/(music|about).html} do
    redirect("/#{params[:captures].first}")
  end

  get %r{/(music|about)/?} do
    File.read("_site/#{params[:captures].first}_.html")
  end
end
