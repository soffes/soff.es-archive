# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Gem dependencies
  config.gem 'mislav-will_paginate', :version => '~> 2.2.3', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'rtomayko-rdiscount', :version => '~> 1.3.4', :lib => 'rdiscount', :source => 'http://gems.github.com'
  config.gem 'haml-edge', :version => '~> 2.1.12'
  config.gem 'chriseppstein-compass', :version => '~> 0.6.15', :lib => 'compass', :source => 'http://gems.github.com'
#  config.gem 'passenger'
  
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  config.time_zone = 'Central Time (US & Canada)'
  
  # Load sweepers
  config.load_paths << "#{RAILS_ROOT}/app/sweepers"
end
