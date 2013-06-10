source 'https://rubygems.org'

# Latest Ruby
ruby '2.0.0'

# Web server
gem 'puma'

# Simple HTTP
gem 'sinatra'
gem 'sinatra-contrib'

# Faster ERB
gem 'erubis'

# Asset pipeline
gem 'sprockets'

# Utilities
gem 'rake'

# group :assets do
  # Stylesheet
  gem 'sass'
  gem 'sprockets-sass'
  gem 'bourbon'

  # Javascript
  gem 'coffee-script'
  gem 'uglifier'
# end

group :test do
  gem 'minitest'
  gem 'minitest-wscolor'
  gem 'miniskirt', require: false
  gem 'capybara'
  gem 'simplecov', require: false
end

group :development do
  # Reloading in development
  gem 'shotgun'
end

# group :production do
#   # Assets
#   gem 'asset_sync'
# end
