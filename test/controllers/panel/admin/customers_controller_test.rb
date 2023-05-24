require "test_helper"

module Panel
  module Admin
    class CustomersControllerTest < BaseTest
      def setup
        super
        @customer = customers(:john)
      end

      test "should get status" do
        Customer.statuses.each do |status|
          get panel_customers_status_url(status: status[0])
          assert_response :success
        end
      end

      test "should update status" do
        assert_equal "new_order", @customer.status
        patch panel_customer_status_update_url(@customer), params: { customer: { status: "canceled_order" } }
        assert_response :redirect
        assert_equal "canceled_order", Customer.find(@customer.id).status
      end

      test "should get edit" do
        get edit_panel_customer_url(@customer)
        assert_response :success
      end

      test "should update customer" do
        patch panel_customer_url(@customer), params: { customer: { first_name: "John 2" } }
        assert_redirected_to panel_customers_status_url(status: @customer.status)
      end

      test "should destroy customer" do
        assert_difference("Customer.count", -1) do
          delete panel_customer_url(@customer)
        end
      end
    end
  end
end
