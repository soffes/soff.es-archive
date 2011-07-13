class PublicErrorsController < ApplicationController
  layout 'application'
  
  def routing_error
    render action: 'not_found'
  end
  
  def conflict
    render action: 'internal_server_error'
  end
  
  def method_not_allowed
    render action: 'internal_server_error'
  end
  
  def not_implemented
    render action: 'internal_server_error'
  end
end
