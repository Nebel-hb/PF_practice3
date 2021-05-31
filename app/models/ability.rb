# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # ログイン/アウトはみんな許可
    can :manage, :session

    user ||= User.new

    if user.general?
      can :manage, :all
    else
      can :read, :all
    end
  end
end

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     can :manage, :session

#     user ||= User.new
#     authorities = user.roles.map{|o| o.authorities }.flatten

#     # manage権限のユーザーを承認
#     manage_users = authorities.select{|o| o.permission == 'manage'}
#     manage_users.each do |auth|
#       can auth.permission.split(',').map{|o| o.to_sym}, auth.name.to_sym
#     end
#     # manage権限以外のユーザーを承認
#     not_manage_users = authorities.select{|o| o.permission != 'manage'}
#     not_manage_users.each do |auth|
#       can auth.permission.split(',').map{|o| o.to_sym}, auth.name.to_sym
#     end
#     # Define abilities for the passed in user here. For example:
#     #
#     #   user ||= User.new # guest user (not logged in)
#     #   if user.admin?
#     #     can :manage, :all
#     #   else
#     #     can :read, :all
#     #   end
#     #
#     # The first argument to `can` is the action you are giving the user
#     # permission to do.
#     # If you pass :manage it will apply to every action. Other common actions
#     # here are :read, :create, :update and :destroy.
#     #
#     # The second argument is the resource the user can perform the action on.
#     # If you pass :all it will apply to every resource. Otherwise pass a Ruby
#     # class of the resource.
#     #
#     # The third argument is an optional hash of conditions to further filter the
#     # objects.
#     # For example, here the user can only update published articles.
#     #
#     #   can :update, Article, :published => true
#     #
#     # See the wiki for details:
#     # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
#   end
# end
