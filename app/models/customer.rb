class Customer < ApplicationRecord
  before_create do
    self.uuid = SecureRandom.uuid
  end

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 300 }
  validates :phone, presence: true, format: { with: /\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}/ }
  validates :uuid, uniqueness: true
  validates :comment, length: { maximum: 300 }
  validates :dont_call, inclusion: { in: [true, false] }

  enum payment_method: %i[cash service]
  enum status: %i[new_order send_order done_order canceled_order]

  has_many :orders, dependent: :nullify
  has_many :products, through: :orders

  def orders_total_price
    orders.sum(&:total_price)
  end

  def orders_total_quantity
    orders.sum(&:quantity)
  end

  def create_orders(session_products)
    Product.where(id: session_products.keys).each do |product|
      Order.create(product:,
                   customer: self,
                   quantity: session_products[product.id.to_s],
                   current_price: product.price)
    end

    # Clear hash of the session
    session_products.clear
  end

  class << self
    def payment_methods_keys_with_translate_text
      payment_methods.keys.map { |key| [I18n.t("panel.customers.form.pay.#{key}"), key] }
    end

    def statuses_keys_with_translate_text
      statuses.keys.map { |key| [I18n.t("panel.customers.form.status.#{key}"), key] }
    end
  end
end
