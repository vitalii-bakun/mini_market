module Panel
  class OrdersController < ResourceController
    def index
      @orders = Customer.find(params[:customer_id]).orders.includes(:product)
    end
  end
end
