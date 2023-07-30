class AddReferenceAdminUserToProducts < ActiveRecord::Migration[7.0]
  def change
     add_reference :products, :admin_user, foreign_key: true
  end
end
