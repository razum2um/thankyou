class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def authenticate
    auth = request.env["omniauth.auth"].except('extra')

    token = UserToken.find_or_create_by!(uid: auth.uid.to_s, provider: auth.provider.to_s)
    if !current_user.guest?
      token.user = current_user
      token.save!
      user = current_user
    elsif token.user.present?
      user = token.user
    else
      user = token.build_user(name: auth.info.name, guest: false)
      user.save!
      token.save!
    end

    if user.image.blank? && auth.info.image.present?
      user.image = auth.info.image
      user.save!
    end

    sign_in_and_redirect user, :event => :authentication
  end

  def after_omniauth_failure_path_for(scope)
    '/'
  end

  alias facebook  authenticate
  alias vkontakte authenticate
  alias google_oauth2 authenticate
  alias github authenticate
  alias twitter authenticate
end
