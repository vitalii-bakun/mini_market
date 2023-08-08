module Admin
  class OrdersController < BaseController
    before_action :set_customer

    def edit
      @order = @customer.orders.find(params[:id])
    end

    def update
      @order = @customer.orders.find(params[:id])

      if @order.update(order_params)
        redirect_to admin_customer_path(@customer),
                    notice: t('.success')
      else
        redirect_to edit_admin_customer_order_path(customer_id: @customer.id, id: @order.id),
                    alert: @order.errors.full_messages
      end
    end

    def new
      @order = @customer.orders.new
    end

    def create
      @customer.orders.create(order_params)
      redirect_to admin_customer_path(@customer),
                  notice: t('.success')
    end

    def destroy
      @customer.orders.find(params[:id]).destroy

      redirect_to admin_customer_path(@customer),
                  notice: t('.success')
    end

    private

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def order_params
      params.require(:order)
            .permit(:product_id,
                    :quantity,
                    :current_price)
    end
  end
end
