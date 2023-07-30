class Cart < ApplicationRecord
  include ProductExtension
  
  belongs_to :market_user
  belongs_to :product
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
