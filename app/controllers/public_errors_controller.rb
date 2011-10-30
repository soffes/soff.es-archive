class PublicErrorsController < ApplicationController
  layout 'application'
  before_filter :internal_server_error, :only => [:conflict, :method_not_allowed, :not_implemented]

  def routing_error
    render 'not_found'
  end

  private

  def internal_server_error
    render 'internal_server_error' and return
  end
end
