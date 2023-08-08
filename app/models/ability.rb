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
    can :status, Customer
    can :read, Order
    can :manage, Product
    cannot :manage, AdminUser
  end
end
