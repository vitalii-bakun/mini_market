module Admin
  class CustomersController < BaseController
    before_action :set_customer, only: %i[show edit update destroy]

    def index
      @customers = params[:status] ? Customer.where(status: "#{params[:status]}_order") : Customer.all
    end

    def show; end

    def edit; end

    def update
      if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer),
                    notice: t('.success')
      else
        redirect_to edit_admin_customer_path(@customer),
                    alert: @customer.errors.full_messages
      end
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        redirect_to admin_customer_path(@customer),
                    notice: t('.success')
      else
        redirect_to new_admin_customer_path,
                    alert: @customer.errors.full_messages
      end
    end

    def destroy
      @customer.destroy
      redirect_to admin_customers_path,
                  notice: t('.success')
    end

    private

    def customer_params
      params.require(:customer)
            .permit(
              :first_name,
              :address,
              :phone,
              :uuid,
              :comment,
              :dont_call,
              :payment_method,
              :status
            )
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
  end
end
