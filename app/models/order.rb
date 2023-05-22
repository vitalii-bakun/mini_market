class Order < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :current_price, numericality: { greater_than: 0 }

  def total_price
    quantity * current_price
  end
end
