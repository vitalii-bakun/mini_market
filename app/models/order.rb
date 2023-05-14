class Order < ApplicationRecord
  include ProductExtension

  belongs_to :product
  belongs_to :customer

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
