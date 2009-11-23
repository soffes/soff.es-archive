require "rdiscount"

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :markdown
  
  def markdown(text)
    text.blank? ? "" : RDiscount.new(text).to_html
  end
  
end
