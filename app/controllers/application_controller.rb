class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :is_iphone?
  
  def is_iphone?
    user_agent = request.env["HTTP_USER_AGENT"]
    user_agent[/iPhone/] && !user_agent[/iPad/]
  end
end
