module ApplicationHelper
  def link_to_social(user, social, link=nil)
    link_to_unless(
      user.has_social?(social),
      (link || social.capitalize),
      user_omniauth_authorize_path(social),
      class: "header-link is-#{social}"
    ) do |name|
      "<span class='header-link is-#{social} active'>#{name}</span>".html_safe
    end
  end
end
