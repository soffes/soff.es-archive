ADMIN_USERNAME = (ENV['ADMIN_USERNAME'] or 'admin')
ADMIN_PASSWORD = (ENV['ADMIN_PASSWORD'] or 'passw0rd')
FACEBOOK_APP_ID = '232071166841950'

class NotFoundError < StandardError; end
