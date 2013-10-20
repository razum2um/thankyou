module ApplicationHelper
  def link_to_social(user, social, link=nil)
    return if user.user_tokens.pluck(:provider).include?(social.to_s)
    link_to (link || social.capitalize), user_omniauth_authorize_path(social), class: "social-link is-#{social}"
  end
end
