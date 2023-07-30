class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :market_user, index: true, null: false
      t.references :product, index: true, null: false
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
