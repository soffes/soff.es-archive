class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :is_iphone?
  rescue_from NotFoundError, with: :error_not_found

private

  def is_iphone?
    user_agent = request.env['HTTP_USER_AGENT']
    user_agent && user_agent[/iPhone/] && !user_agent[/iPad/] && !user_agent[/iPod/]
  end

  def error_not_found
    render template: 'errors/not_found', layout: 'error'
  end
end
