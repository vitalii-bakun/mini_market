class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, limit: 100
      t.string :address, null: false, limit: 300
      t.string :phone, null: false, unique: true
      t.string :uuid, null: false, unique: true, index: true, limit: 36
      t.text :comment, null: true, limit: 300
      t.boolean :dont_call, default: false
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
