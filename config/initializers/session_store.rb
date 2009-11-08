# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_samsoff.es_session',
  :secret      => '8ad9449e3e02b227b954dd607335feb69215e68e32d1659976a525cbb20cce8f2759f691da18fd8d29e555f6f2bb0101de3af1ceddda121b026da1be582fbef0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
