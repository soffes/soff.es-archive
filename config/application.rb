require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require :default, Rails.env

module SamSoffes
  class Application < Rails::Application

    config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => true
    end

    config.filter_parameters << :password
  end
end
