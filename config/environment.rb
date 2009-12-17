RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
    
  config.gem "rdiscount", :version => "1.5.5", :source => "http://gemcutter.org"
  config.gem "less", :version => "1.2.12", :source => "http://gemcutter.org"
  config.gem "will_paginate", :version => "2.3.11", :source => "http://gemcutter.org"
  config.gem "refraction", :version => "0.1.0", :source => "http://gemcutter.org"
  
  config.time_zone = 'Central Time (US & Canada)'
  
end

ActiveRecord::Base.include_root_in_json = false
