class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def localhost?
    request.remote_ip.in? ['127.0.0.1', 'localhost']
  end
end
