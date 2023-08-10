# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin_user)
    if admin_user.nil?
      anonymous
    elsif admin_user.moderator?
      moderator
    elsif admin_user.administrator?
      administrator
    end
  end

  private

  def anonymous
    cannot :manage, :all
  end

  def administrator
    can :manage, :all
  end

  def moderator
    can :read, :dashboard
    can :manage, Customer
    can :manage, Order
    can :manage, Product
    can :manage, MarketUser
    cannot :manage, AdminUser
    cannot :manage, Page
  end
end
