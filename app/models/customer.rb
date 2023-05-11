class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :dont_call, inclusion: { in: [true, false] }

  has_many :order_customer_product

  has_and_belongs_to_many :products, join_table: :order_customer_product

  def create_order!(session_products, payment_method)
    Product.where(id: session_products.keys).each do |product|
      OrderCustomerProduct.create!(customer: self, product:, quantity: session_products[product.id.to_s],
                                   payment_method:)
    end
  end
end
