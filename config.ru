require 'rubygems'
require 'bundler'
Bundler.require

$LOAD_PATH.unshift 'lib'
require 'soffes'

require 'sprockets'
map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/javascripts'
  sprockets.append_path 'assets/stylesheets'
  sprockets.append_path 'vendor/assets/javascripts'
  run sprockets
end

map '/' do
  run Soffes::Application
end
