class MarketUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 300 }
  validates :phone, presence: true, format: { with: /\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}/ }

  has_many :customers, dependent: :destroy
  has_many :carts, dependent: :destroy

  def total_quantity_products_in_cart
    carts.sum(&:quantity)
  end
end
