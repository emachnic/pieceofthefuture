# Be sure to restart your server when you modify this file.

Pieceofthefuture::Application.config.session_store :cookie_store, :key => '_pieceofthefuture_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Pieceofthefuture::Application.config.session_store :active_record_store
#ActionController::Base.session = {
#:namespace   => 'sessions',
#:expire_after => 20.minutes.to_i,
#:memcache_server => ['mc3.ec2.northscale.net']
#}

#require 'action_dispatch/middleware/session/dalli_store'
#Rails.application.config.session_store :dalli_store, :memcache_server => ['mc3.ec2.northscale.net'], :namespace => 'sessions', :expire_after => 30.minutes


