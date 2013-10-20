class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def authenticate
    auth = request.env["omniauth.auth"].except('extra')

    Rails.logger.error('WOW!' + auth.inspect)
    #if user = User.find_by_oauth(auth)
    #  sign_in_and_redirect user, :event => :authentication
    #elsif oauth_user(auth).save
    #  clean_up_passwords @oauth_user
    #  sign_in_and_redirect @oauth_user, :event => :authentication
    #else
    #  session["devise.oauth_data"] = auth
    #  redirect_to register_path
    #end
  end

  alias facebook  authenticate
  alias vkontakte authenticate
  alias google_oauth2 authenticate
  alias github authenticate
end
