class AddColumPaymentMethodToTableOrderCustomerProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :order_customer_product, :payment_method, :integer, default: 0
  end
end
