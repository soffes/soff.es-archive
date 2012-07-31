source :rubygems

gem 'rails', '3.2.7'
gem 'pg'
gem 'thin'
gem 'kaminari'
gem 'goalie'
gem 'redcarpet'
# gem 'pygments.rb'
gem 'pygmentize'
gem 'asset_sync'

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
  # gem 'taps'
  # gem 'sqlite3'
  gem 'quiet_assets'
end

group :test do
  gem 'minitest'
  gem 'miniskirt', require: false
  gem 'capybara'
  gem 'turn'
  gem 'simplecov', :require => false
end

group :production do
  gem 'dalli'
end
