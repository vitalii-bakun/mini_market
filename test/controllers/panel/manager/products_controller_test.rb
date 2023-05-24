require "test_helper"

module Panel
  module Manager
    class ProductsControllerTest < BaseTest
      def setup
        super
        @apple = products(:apple)
        @orange = products(:orange)
      end

      test "should get index" do
        get panel_products_url
        assert_response :success
      end

      test "should get show" do
        get panel_product_url(@apple)
        assert_response :success
      end

      test "should get new" do
        get new_panel_product_url
        assert_response :success
      end

      test "should get edit" do
        get edit_panel_product_url(@apple)
        assert_response :success
      end

      test "should update product" do
        patch panel_product_url(@orange), params: { product: { title: "New Orange" } }
        assert_redirected_to panel_product_url(@orange)
        assert_equal "New Orange", @orange.reload.title
      end

      test "should create product" do
        post panel_products_url,
             params: { product: { title: "New Apple",
                                  description: "New Apple Description",
                                  body: "New Apple Body",
                                  price: 10.0,
                                  available: true } }

        product = Product.last
        assert_redirected_to panel_product_url(product)
        assert_equal "New Apple", product.title
      end

      test "should destroy product" do
        delete panel_product_url(@apple)
        assert_redirected_to panel_products_url
      end
    end
  end
end
