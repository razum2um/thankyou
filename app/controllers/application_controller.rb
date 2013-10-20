class ApplicationController < ActionController::Base
  include Evercookie::ControllerHelpers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :setup_evercookie
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def setup_evercookie
    set_evercookie(:uid, new_evercookie_id) unless evercookie_get_value(:uid)
  end

  def localhost?
    request.remote_ip.in? ['127.0.0.1', 'localhost']
  end

  def new_evercookie_id
    SecureRandom.hex(5)
  end
end
