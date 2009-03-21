# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_samsoff.es_session',
  :secret      => '1a4321ed52a75abb1b4ece1a6ea16c3c480ec65363fba3353bce10ddc0663324d7ade7455c644ee3ba0b7a0bed0f86f0b9c273b9f45c63c35c8b3f6dcaa79342'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
