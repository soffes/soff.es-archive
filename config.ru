require 'rubygems'
require 'bundler'
Bundler.require

require 'sprockets'
map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/javascripts'
  sprockets.append_path 'assets/stylesheets'
  sprockets.append_path 'assets/images'
  run sprockets
end

require './application'
map '/' do
  run Soffes
end
