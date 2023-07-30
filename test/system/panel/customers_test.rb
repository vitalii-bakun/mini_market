module Admin
  class CustomersTest < BaseSystemTest
    setup do
      @customer = customers(:john)
    end

    test "visiting new order page table of customers" do
      visit admin_customers_status_url(status: 'new_order')
      assert_selector "table", text: "John"
    end

    test "visiting new order page and update status" do
      visit admin_customers_status_url(status: 'new_order')

      select 'Send', match: :first
      click_button "Update", match: :first
      
      assert_text 'Customer status was successfully updated.'
    end

    test "visiting new order page and edit customer" do
      visit admin_customers_status_url(status: 'new_order')

      click_link "Edit", match: :first

      fill_in "customer[first_name]", with: "John 2"
      click_button "Update Customer", match: :first

      assert_text 'Customer was successfully updated.'
    end
  end
end
