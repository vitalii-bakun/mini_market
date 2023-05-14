require "test_helper"

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_create_url
    assert_response :success
  end
end
