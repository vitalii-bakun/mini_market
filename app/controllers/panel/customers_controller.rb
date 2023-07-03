module Panel
  class CustomersController < BaseController
    before_action :set_customer, only: %i[edit update destroy]

    def orders
      @orders = Customer.find(params[:customer_id]).orders.includes(:product)
    end

    def status
      @customers = Customer.where(status: params[:status])
    end

    def edit; end

    def update
      if @customer.update(customer_params)
        redirect_to panel_customers_status_path(status: @customer.status),
                    notice: t('.success')
      else
        redirect_to edit_panel_product_path, alert: @customer.errors.full_messages
      end
    end

    def destroy
      @customer.destroy
      redirect_to panel_dashboard_path, notice: t('.success')
    end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :address, :phone, :uuid,
                                       :comment, :dont_call, :payment_method, :status)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
  end
end
