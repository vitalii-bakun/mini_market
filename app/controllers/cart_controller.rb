class CartController < ApplicationController
  before_action :set_empty_hash_to_session, unless: :session_has_hash?

  def index
    @cart_products = CartProduct.all(session_products)
  end

  def create
    set_product_to_session
    render_json_message t('.success'), :created
  end

  def destroy
    id = params[:product_id]

    if session_products.key?(id)
      session_products.delete(id)
      render_json_message t('.success'), :ok
    else
      render_json_message t('.not_found'), :not_found
    end
  end

  private

  # @return [ActionDispatch::Request::Session]
  def session_products
    session[:products]
  end

  def cart_params
    params.permit(:product_id, :quantity)
  end

  def set_empty_hash_to_session
    session[:products] = {}
  end

  def session_has_hash?
    session_products.is_a?(Hash)
  end

  def render_json_message(value, status)
    render json: { message: value }, status:
  end

  def set_product_to_session
    id = cart_params[:product_id].to_s
    quantity = cart_params[:quantity]

    session_products[id] = if session_products.key?(id)
                             session_products[id].to_i + quantity.to_i
                           else
                             quantity
                           end
  end
end
