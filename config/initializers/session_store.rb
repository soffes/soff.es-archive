# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_samsoff.es_session',
  :secret      => '88646e75722aafad83ce99e7534ea8b63b8c8fd44d6f5b5d47ac94d58840a94d4a27650560fd8187c22a098be4dda3b5deebf4a7437d4edeb518a07be9b81bd7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
