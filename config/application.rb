require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require :default, Rails.env
require 'goalie/rails'

module SamSoffes
  class Application < Rails::Application

    config.time_zone = 'Central Time (US & Canada)'
    config.encoding = 'utf-8'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => true
    end

    config.filter_parameters << :password
    
    config.secret_token = "n7@XY2a!pUj{oYK*cQ{VqVDH[8DRRhZdQQy!i,Rnw;BZS/7Xk_S8p9Wd@m"
    
    # Enable IdentityMap for Active Record, to disable set to false or remove the line below.
    config.active_record.identity_map = true

    # Enable the asset pipeline
    config.assets.enabled = true
  end
end
