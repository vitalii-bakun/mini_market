require "test_helper"


module Market
  class ProductsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @product = products(:apple)
    end

    test "should get index" do
      get products_url
      assert_response :success
    end

    test "should show product" do
      get product_url(@product)
      assert_response :success
    end
  end
end
