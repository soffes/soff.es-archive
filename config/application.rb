require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

require 'goalie/rails'

module SamSoffes
  class Application < Rails::Application
    
    config.autoload_paths << "#{config.root}/lib"

    config.time_zone = 'Central Time (US & Canada)'
    config.encoding = 'utf-8'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => false
    end

    config.filter_parameters << :password

    config.secret_token = "n7@XY2a!pUj{oYK*cQ{VqVDH[8DRRhZdQQy!i,Rnw;BZS/7Xk_S8p9Wd@m"

    # Enable IdentityMap for Active Record, to disable set to false or remove the line below.
    config.active_record.identity_map = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0.3'
  end
end
