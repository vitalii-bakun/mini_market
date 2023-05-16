# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      admin
    elsif user.manager?
      manager
    end
  end

  private

  def admin
    can :manage, :all
  end

  def manager
    can %i[status status_update], Customer
    can %i[read], Order
    can :manage, Product
  end
end
