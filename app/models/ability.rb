class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Card, public: true
    can :read, Card, user_id: user.id
    can :manage, Card, author_id: user.id
  end
end
