class AddFirstNameAndAddressAndPhoneToMarketUser < ActiveRecord::Migration[7.0]
  def change
    add_column :market_users, :first_name, :string, null: false, limit: 100
    add_column :market_users, :address, :string, null: false, limit: 300
    add_column :market_users, :phone, :string, null: false, limit: 100

    add_belongs_to :customers, :market_user
  end
end
