module Admin
  class ProductsTest < BaseSystemTest
    setup do
      @product = products(:apple)
    end

    test "visiting the index" do
      visit admin_products_url
      assert_selector "table", text: "Product name"
    end

    test "should create product" do
      visit admin_products_url
      click_on "New product"

      fill_in "product[title]", with: "Apple 3"
      fill_in "product[price]", with: 29.99
      fill_in "product[body]", with: Faker::Lorem.paragraph
      fill_in "product[description]", with: Faker::Lorem.paragraph

      click_on "Send"

      assert_text "Product was successfully created."
      click_on "Back to products"
    end

    test "should update Product" do
      visit admin_product_url(@product)
      click_on "Edit this product", match: :first

      fill_in "product[title]", with: "Edit Apple 3"
      fill_in "product[price]", with: @product.price
      fill_in "product[body]", with: Faker::Lorem.paragraph
      fill_in "product[description]", with: Faker::Lorem.paragraph

      click_on "Send"

      assert_text "Product was successfully updated."
      click_on "Back to products"
    end

    test "should destroy Product" do
      visit admin_product_url(@product)
      click_on "Destroy this product", match: :first

      assert_text "Product was successfully deleted."
    end
  end
end
