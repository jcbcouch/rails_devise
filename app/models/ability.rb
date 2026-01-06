class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user (not logged in)
    
    if user.admin?
      # Admin can do everything
      can :manage, :all
    elsif user.moderator?
      # Moderator can access moderator dashboard and read everything
      can :access, :moderator_dashboard
      can :read, :all
      cannot :destroy, User
    elsif user.persisted?
      # Regular logged-in user can read everything
      can :read, :all
    else
      # Guest user can read everything
      can :read, :all
    end
  end
end