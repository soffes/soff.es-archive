source 'https://rubygems.org'

# Rails
gem 'rails', '3.2.8'

# Postgres
gem 'pg'

# Elastic search
gem 'tire'

# Web server
gem 'thin'

# Pagination
gem 'kaminari'

# Error pages
gem 'goalie'

# Markdown
gem 'redcarpet'

# Code coloring
gem 'pygmentize'

# HTML Parsing
gem 'nokogiri'

group :assets do
  # Stylesheet
  gem 'sass', '~> 3.2.0.alpha.277'
  gem 'sass-rails'
  gem 'bourbon'

  # Javascript
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'jquery-rails'
end

group :development do
  gem 'heroku'
  gem 'taps'
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'foreman'
end

group :test do
  gem 'minitest'
  gem 'miniskirt', require: false
  gem 'capybara'
  gem 'turn'
  gem 'simplecov', :require => false
end

group :production do
  # Memcached
  gem 'dalli'

  # Assets
  gem 'asset_sync'
end
