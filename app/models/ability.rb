class Ability
  include CanCan::Ability

  def initialize(user)
	  user ||= User.new

    can :manage, :all if user.role == "admin"

    if user.role == "moderator"
	    can [:read, :create, :update, :destroy], Post
      can [:read, :create], Answer
			can :update, User, :id => user.id
     end

		if user.role == "user"
		  can [:read, :create], [Post, Answer]
		  can [:update, :destroy], Post, :user_id => user.id
		  can :update, User, :id => user.id
    end

  end
end
