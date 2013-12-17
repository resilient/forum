class Ability
  include CanCan::Ability

  def initialize(user)
     #user ||= User.new # guest user (not logged in)
     #if user.role == "admin"
     #  can :manage, :all
     #elsif user.role == "moderator"
     #  can :read, Topic
     #end

     can :manage, :all if user.role == "admin"
     can :read,   :all if user.role == "moderator"

    # here are :read, :create, :update and :destroy.
    #
    #   can :update, Article, :published => true
  end
end
