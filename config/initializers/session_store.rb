# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_SamSoffes_session',
  :secret => '31d59775eb584216d46a05db9481f7dbe68691b4cdf8d565f948f8f52b71380b967a5932960aa76ac153b5d9d19bfd8d40afb19031faca869e1589568ab17f09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
