class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:create], User
    can [:manage], User, :id => user.id

    can [:create], List
    can [:read], List, :public => true
    can [:manage], List, :user_id => user.id
  end
end
