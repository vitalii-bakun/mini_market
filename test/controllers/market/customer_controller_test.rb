require "test_helper"

module Market
  class CustomerControllerTest < ActionDispatch::IntegrationTest
    def setup
      post product_cart_add_url(products(:apple)), params: { quantity: "2" }
    end

    test "should get new" do
      get new_customer_url
      assert_response :success
    end

    test "should show a customer" do
      get customer_url(id: customers(:john).uuid)
      assert_response :success
    end

    test "should create a customer" do
      assert_difference("Customer.count") do
        post customers_url, params: {
          customer: {
            first_name: "John",
            address: "Street 1",
            phone: "+380456789033",
            comment: "",
            dont_call: false,
            payment_method: "cash"
          }
        }
      end
    end
  end
end
