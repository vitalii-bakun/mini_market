class AddDescriptionAvailablePresentetionToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :description, :string
    add_column :products, :available, :boolean
  end
end
