# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(model)
    if model.nil?
      anonymous
    elsif model.user?
      user
    elsif model.manager?
      manager
    elsif model.admin?
      admin
    end
  end

  private

  def anonymous
    cannot :manage, :all
  end

  def user
    cannot :manage, :all
  end

  def admin
    can :manage, :all
  end

  def manager
    can :status, Customer
    can :read, Order
    can :manage, Product
    cannot :manage, User
  end
end
