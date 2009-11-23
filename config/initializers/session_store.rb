# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_samsoff.es_session',
  :secret      => '9d7035d3beff775a877a9cba27bcf3921fe8b6b73b5b41a21a2eeca205791f620c30c89751f209bbca791bbfb6d2debdc200aeefc0c0bece984ff8a7b674a698'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
