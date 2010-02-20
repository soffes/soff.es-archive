class AdminController < ApplicationController
  
  before_filter :authenticate
  layout "application"

  def index
    redirect_to admin_posts_url
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ::ENV['ADMIN_USERNAME'] && password == ::ENV['ADMIN_PASSWORD']
    end
  end
  
end
