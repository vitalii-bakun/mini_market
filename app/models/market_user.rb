class MarketUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :first_name, length: { maximum: 100 }
  validates :address, length: { maximum: 300 }
  validates :phone, length: { maximum: 100 }

  has_many :customers, dependent: :destroy
  has_many :carts, dependent: :destroy

  def total_quantity_products_in_cart
    carts.sum(&:quantity)
  end

  def product_in_cart?(product)
    !carts.find_by(product_id: product.id).nil?
  end

  def self.from_omniauth(auth)
    info = auth['info']
    find_or_create_by(email: info['email']) do |user|
      user.email = info['email']
      user.password = Devise.friendly_token[8, 14]
      user.first_name = info['first_name']
      user.phone = ""
      user.address = ""
    end
  end
end
