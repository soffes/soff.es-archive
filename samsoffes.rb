# Bundler
require File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))
Bundler.require_env

JEKYLL_ROOT = "jekyll/_site"

class SamSoffes < Sinatra::Default
  set :public, JEKYLL_ROOT
 
  # This before filter ensures that your pages are only ever served 
  # once (per deploy) by Sinatra, and then by Varnish after that
  before do
    response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
  end

  not_found do
    File.read("#{JEKYLL_ROOT}/four-oh-four.html")
  end

  get '/' do
    File.read("#{JEKYLL_ROOT}/index.html")
  end

  get %r{/post/([a-zA-Z\-_]+)/?} do
    File.read("#{JEKYLL_ROOT}/post/#{params[:captures].first}/index.html") or not_found
  end

  get %r{/(music|about|clearance).html} do
    redirect("/#{params[:captures].first}")
  end

  get %r{/(music|about|clearance)/?} do
    File.read("#{JEKYLL_ROOT}/#{params[:captures].first}_.html")
  end
end
