class AdminController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  def index
    redirect_to admin_posts_url
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ADMIN_USERNAME && password == ADMIN_PASSWORD
    end
  end
end
