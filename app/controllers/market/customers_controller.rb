module Market
  class CustomersController < BaseController
    before_action :cart_has_not_products, only: %i[create], if: :user_has_products_in_cart?

    def index
      @customers = current_market_user.customers
    end

    def new
      @customer = Customer.new(address: current_market_user.address,
                               phone: current_market_user.phone,
                               first_name: current_market_user.first_name)
    end

    def show
      @customer = Customer.find_by_uuid!(params[:id])

      call_liqpay if @customer.service?
    end

    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        # Creating orders for the customer
        @customer.create_orders_and_destroy_all_from_carts
        # Notification the customer about the order
        notification_created_order
        redirect_to customer_path(id: @customer.uuid),
                    notice: t('.success')
      else
        redirect_to new_customer_path,
                    alert: t('.error')
      end
    end

    private

    def call_liqpay
      # Generating HTML payment form if the customer has chosen the service
      @html_form_pay = LiqpayService.generate_form(amount: @customer.orders_total_price,
                                                   description: @customer.orders.map do |o|
                                                                  "#{o.product.title} : #{o.quantity}"
                                                                end.join(', '),
                                                   order_id: @customer.uuid,
                                                   result_url: customer_url(id: @customer.uuid))

      return if @customer.payment_status?

      OrderStatusJob.set(wait: 5.seconds).perform_later(@customer)
    end

    def notification_created_order(wait: 10.seconds)
      return if @customer.payment_status?

      NotificationsMailer.order_was_successfully_created(@customer).deliver_later(wait:)
    end

    def user_has_products_in_cart?
      current_market_user.carts.empty?
    end

    def cart_has_not_products
      redirect_to root_path,
                  alert: t('market.customers.cart_empty')
    end

    def customer_params
      params.require(:customer)
            .permit(:first_name,
                    :address,
                    :phone,
                    :comment,
                    :dont_call,
                    :payment_method)
            .merge(market_user: current_market_user)
    end
  end
end
