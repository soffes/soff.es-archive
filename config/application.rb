require File.expand_path('../boot', __FILE__)
require 'rails/all'

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end

module Soffes
  class Application < Rails::Application
    config.autoload_paths << "#{config.root}/lib"
    config.time_zone = 'Pacific Time (US & Canada)'
    config.encoding = 'utf-8'
    config.filter_parameters << :password
    config.secret_key_base = 'n7@XY2a!pUj{oYK*cQ{VqVDH[8DRRhZdQQy!i,Rnw;BZS/7Xk_S8p9Wd@m'
    config.session_store :cookie_store, key: '_soffes_session'
    config.assets.enabled = true
    config.assets.version = '1.0.3'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => false
    end
  end
end
