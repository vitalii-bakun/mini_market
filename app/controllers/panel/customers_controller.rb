module Panel
  class CustomersController < ResourceController
    before_action :set_customer, only: %i[edit update destroy]
    before_action :set_customer_by_customer_id, only: %i[status_update]

    def status
      @customers = Customer.where(status: params[:status])
    end

    def status_update
      if @customer.update(status_params)
        redirect_to panel_customers_status_path(status: @customer.status),
                    notice: "Customer status was successfully updated."
      else
        redirect_to edit_panel_customer_path, alert: @customer.errors.full_messages
      end
    end

    def edit; end

    def update
      if @customer.update(customer_params)
        redirect_to panel_customers_status_path(status: @customer.status),
                    notice: "Customer was successfully updated."
      else
        redirect_to edit_panel_product_path, alert: @customer.errors.full_messages
      end
    end

    def destroy
      @customer.destroy
      redirect_to panel_dashboard_path, notice: "Customer was successfully destroyed."
    end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :address, :phone, :uuid, :discount, :comment, :dont_call,
                                       :payment_method, :status)
    end

    def status_params
      params.require(:customer).permit(:status)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_customer_by_customer_id
      @customer = Customer.find(params[:customer_id])
    end
  end
end
