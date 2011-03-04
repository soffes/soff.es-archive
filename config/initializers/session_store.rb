ActionController::Base.session = {
  # :namespace   => 'sessions',
  # :expire_after => 20.minutes.to_i,
  # :memcache_server => ['server-1:11211', 'server-2:11211'],
  :key    => '_SamSoffes_session',
  :secret => '31d59775eb584216d46a05db9481f7dbe68691b4cdf8d565f948f8f52b71380b967a5932960aa76ac153b5d9d19bfd8d40afb19031faca869e1589568ab17f09'
}

# require 'action_controller/session/dalli_store'
# ActionController::Base.session_store = :dalli_store
