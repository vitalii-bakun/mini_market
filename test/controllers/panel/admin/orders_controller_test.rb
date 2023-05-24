require "test_helper"

module Panel
  module Admin
    class OrdersControllerTest < BaseTest
      setup do
        setup
        @customer = customers(:john)
      end

      test "should get all orders of a customer" do
        get panel_customer_orders_url(@customer)
        assert_response :success
      end
    end
  end
end
