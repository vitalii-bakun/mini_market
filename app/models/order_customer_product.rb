class OrderCustomerProduct < ApplicationRecord
  self.table_name = 'order_customer_product'
  belongs_to :customer
  belongs_to :product

  enum payment_method: {
    cash: 0,
    card: 1,
    service: 2
  }

  def total_price
    product.price * quantity
  end
end
