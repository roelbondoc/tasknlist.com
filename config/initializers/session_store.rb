# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasknlist_session',
  :secret      => 'e10f89702bdaa0874d9242d6662c8444d53e40bf60cb66ab3437c30e33ef15e388f1a2437c68d11cc4cbfec175e94c7e81430d5f9bea0643f6dc893b1fa2c8b1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
