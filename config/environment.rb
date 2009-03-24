# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.gem 'mislav-will_paginate', :version => '~> 2.2.3', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'rtomayko-rdiscount', :version => '~> 1.3.4', :lib => 'rdiscount', :source => 'http://gems.github.com'
  
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  config.time_zone = 'Central Time (US & Canada)'
end
