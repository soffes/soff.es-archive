# Bundler
begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end
require "sinatra"

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
