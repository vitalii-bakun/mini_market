require "test_helper"

module Admin
  module Manager
    class CustomersControllerTest < BaseTest
      def setup
        super
        @customer = customers(:john)
      end

      test "should get status" do
        Customer.statuses.each do |status|
          get admin_customers_status_url(status: status[0])
          assert_response :success
        end
      end

      test "should update status" do
        assert_equal "new_order", @customer.status
        patch admin_customer_status_update_url(@customer), params: { customer: { status: "canceled_order" } }
        assert_response :redirect
        assert_equal "canceled_order", Customer.find(@customer.id).status
      end

      test "access this pages" do
        assert_raises CanCan::AccessDenied do
          get edit_admin_customer_url(@customer)
          patch admin_customer_url(@customer), params: { customer: { first_name: "John 2" } }
          delete admin_customer_url(@customer)
        end
      end
    end
  end
end
