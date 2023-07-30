module Admin
  class OrdersController < BaseController
    def index
      @orders = Customer.find(params[:customer_id]).orders.includes(:product)
    end
  end
end
