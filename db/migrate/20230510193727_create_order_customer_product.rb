class CreateOrderCustomerProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :order_customer_product do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
    end
  end
end
