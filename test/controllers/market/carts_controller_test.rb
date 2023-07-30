require "test_helper"

module Market
  class CartsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @product = products(:apple)
    end

    test "should get index" do
      get cart_url
      assert_response :success
    end

    test "should add product in cart" do
      post product_cart_add_url(@product), params: { quantity: 1 }
      assert_response :created
    end

    test "should removes product from cart" do
      post product_cart_add_url(@product), params: { quantity: 1 }
      delete product_cart_destroy_url(@product)
      assert_redirected_to cart_url
    end

    test "should remove all products from cart" do
      delete cart_destroy_all_url
      assert_redirected_to root_url
    end
  end
end
