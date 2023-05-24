class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, index: true
      t.references :product, index: true
      t.integer :quantity, default: 0
      t.decimal :current_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
