class MarketController < ApplicationController
  before_action :set_hash_to_session, unless: :session_has_hash?

  protected

  def session_products
    session[:products]
  end

  def session_products_empty?
    session_products.blank?
  end

  private

  def set_hash_to_session
    session[:products] = {}
  end

  def session_has_hash?
    session_products.is_a?(Hash)
  end
end
