require "application_system_test_case"

module Market
  class CartTest < ApplicationSystemTestCase
    setup do
      @product = products(:apple)
    end

    test "add product to cart in root page" do
      add_product_to_cart

      assert_selector :xpath, "/html/body/div/table/tfoot/tr/td[2]", text: "1"
    end

    test "add product to cart with quantity" do
      visit product_url(@product)

      fill_in "quantity", with: "2"
      click_button "Buy", match: :first

      assert_text "Product added to cart"

      visit cart_url

      assert_selector :xpath, "/html/body/div/table/tfoot/tr/td[2]", text: "2"
    end

    test "remove product from cart" do
      add_product_to_cart

      click_button "Remove", match: :first

      assert_text 'Product removed from cart'
    end

    test "make a new order in cart" do
      add_product_to_cart

      click_link 'Make a new order', match: :first

      name = "John Doe"

      fill_in "customer[first_name]", with: name
      fill_in "customer[address]", with: "Street 1"
      fill_in "customer[phone]", with: "+123456789023"
      fill_in 'customer[comment]', with: 'Comment first'
      fill_in "customer[discount]", with: "Discount"
      check "customer[dont_call]", match: :first
      choose 'customer_payment_method_card'
      click_button 'Confirm', match: :first

      assert_text "Hello, #{name}!"
    end

    private

    def add_product_to_cart
      visit root_url

      click_button "Add to cart", match: :first
      assert_text "Product added to cart"

      click_link 'Cart', match: :first
    end
  end
end
