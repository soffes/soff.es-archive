source 'https://rubygems.org'

# Latest Ruby
ruby '2.0.0'

# Rails
gem 'rails', '4.0.0.beta1'

# Postgres
gem 'pg'

# Web server
gem 'puma'

# Pagination
gem 'kaminari'

# Markdown
gem 'redcarpet'

# Code coloring
gem 'pygmentize'

# HTML Parsing
gem 'nokogiri'

group :assets do
  # Stylesheet
  gem 'sass', '>= 3.2.0'
  gem 'sass-rails', '4.0.0.beta1'
  gem 'bourbon'

  # Javascript
  gem 'coffee-rails', '4.0.0.beta1'
  gem 'uglifier'
  gem 'jquery-rails'
end

group :development do
  gem 'quiet_assets'
end

group :test do
  gem 'minitest'
  gem 'miniskirt', require: false
  gem 'capybara'
  gem 'turn'
  gem 'simplecov', require: false
end

group :production do
  # Memcached
  gem 'dalli'

  # Assets
  gem 'asset_sync'
end
