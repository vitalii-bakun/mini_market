class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.text :comment
      t.boolean :dont_call, default: false
      t.decimal :change, precision: 8, scale: 2
      t.string :discount

      t.timestamps
    end
  end
end
