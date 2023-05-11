class CheckoutController < ApplicationController
  def index
    @card_products = CartProduct.all(session_products)
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      customer.create_order!(session_products, puyment_params)
      session_products.clear
      redirect_to checkout_path(id: customer.id)
    else
      redirect_to checkout_index_path, alert: customer.errors.full_messages
    end
  end

  def show
    @orders = OrderCustomerProduct.where(customer_id: params[:id])
  end

  private

  def session_products
    session[:products] ||= {}
  end

  def customer_params
    params.require(:customer).permit(:first_name, :address, :phone, :comment, :change, :dont_call, :discount)
  end

  def puyment_params
    params[:customer][:payment_method]
  end
end
