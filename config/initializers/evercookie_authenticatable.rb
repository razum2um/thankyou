require 'devise/strategies/authenticatable'
 
module Devise
  module Strategies
    class EvercookieAuthenticatable < Authenticatable
      def valid?
        true
      end

      def authenticate!
        unless uid = controller.evercookie_get_value(:uid)
          uid = controller.send(:setup_evercookie)
        end
        success! User.find_or_create_by!(evercookie: uid, guest: true)
      end

      def controller
        env["action_controller.instance"]
      end
    end
  end
end

Warden::Strategies.add(:evercookie, Devise::Strategies::EvercookieAuthenticatable)
