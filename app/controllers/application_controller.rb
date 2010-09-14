class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :is_iphone?
  
  def is_iphone?
    user_agent = request.env['HTTP_USER_AGENT']
    user_agent[/iPhone/] && !user_agent[/iPad/]
  end
  
  def render_optional_error_file(status_code)
    known_codes = %w{404 422 500}
    status = interpret_status(status_code)
    if known_codes.include?(status)
      render :template => "errors/#{status[0,3]}", :status => status
    else
      render :template => 'errors/unknown', :status => status
    end
  end
end
