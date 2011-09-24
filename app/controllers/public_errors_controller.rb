class PublicErrorsController < ApplicationController
  layout 'application'

  def routing_error
    render 'not_found'
  end

  def conflict
    render 'internal_server_error'
  end

  def method_not_allowed
    render 'internal_server_error'
  end

  def not_implemented
    render 'internal_server_error'
  end
end
