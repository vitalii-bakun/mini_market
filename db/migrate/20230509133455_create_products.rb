class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.text :body
      t.string :description
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
