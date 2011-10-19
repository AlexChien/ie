class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user
      can :access, :rails_admin
      if user.has_role?("admin")
        can :manage, :all
      elsif user.has_role?("hr")
        can :manage, [Department, Job]
      end
    end
    
    # if user && user.admin?
    #   can :access, :rails_admin       # only allow admin users to access Rails Admin
    #   if user.role? :superadmin
    #     can :manage, :all             # allow superadmins to do anything
    #   elsif user.role? :manager
    #     can :manage, [User, Product]  # allow managers to do anything to products and users
    #   end
    # end
    
  end
end
