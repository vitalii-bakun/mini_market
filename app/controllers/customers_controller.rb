class CustomersController < MarketController
  before_action :cart_has_not_products, only: [:create], if: :session_products_empty?

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find_by_uuid(params[:id])

    return if @customer

    redirect_to root_path, alert: t('.not_found')
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      # Creating an order for each product
      customer.create_orders(session_products)

      redirect_to customer_path(id: customer.uuid), notice: t('.success')
    else
      redirect_to new_customer_path, alert: t('.error')
    end
  end

  private

  def cart_has_not_products
    redirect_to root_path, alert: t('customers.not_products')
  end

  def customer_params
    params.require(:customer).permit(:first_name, :address, :phone, :comment, :discount, :dont_call, :payment_method)
  end
end
