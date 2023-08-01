class Customer < ApplicationRecord
  before_create :set_uuid

  belongs_to :market_user
  has_many :orders, dependent: :nullify
  has_many :products, through: :orders

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 300 }
  validates :phone, presence: true, format: { with: /\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}/ }
  validates :uuid, uniqueness: true
  validates :comment, length: { maximum: 300 }
  validates :dont_call, inclusion: { in: [true, false] }
  validates :payment_status, inclusion: { in: [true, false] }

  enum payment_method: %i[cash service]
  enum status: %i[new_order send_order done_order canceled_order]

  def orders_total_price
    orders.sum(&:total_price)
  end

  def orders_total_quantity
    orders.sum(&:quantity)
  end

  def create_orders_and_destroy_all_from_carts
    market_user.carts.each do |cart|
      orders.create(
        product: cart.product,
        quantity: cart.quantity,
        current_price: cart.product.price
      )
    end

    market_user.carts.destroy_all
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
