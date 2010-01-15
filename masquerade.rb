require 'rubygems'
require 'sinatra'
 
set :public, Proc.new { File.join(root, "_site") }
 
# This before filter ensures that your pages are only ever served 
# once (per deploy) by Sinatra, and then by Varnish after that
before do
  response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
end

not_found do
  File.read('_site/404.html')
end

get '/' do
  File.read('_site/index.html')
end

# get '/music.html' do
#   redirect('/music')
# end
# 
# get '/music' do
#   File.read('_site/music_.html')
# end
# 
# get '/about.html' do
#   redirect('/about')
# end
# 
# get '/about' do
#   File.read('_site/about_.html')
# end
