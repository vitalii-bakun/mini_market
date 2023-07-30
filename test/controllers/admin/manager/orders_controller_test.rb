require "test_helper"

module Admin
  module Manager
    class OrdersControllerTest < BaseTest
      setup do
        setup
        @customer = customers(:john)
      end

      test "should get all orders of a customer" do
        get admin_customer_orders_url(@customer)
        assert_response :success
      end
    end
  end
end
