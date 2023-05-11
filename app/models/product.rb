class Product < ApplicationRecord
  has_one_attached :presentation

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :body, presence: true
  validates :available, inclusion: { in: [true, false] }

  has_many :order_customer_product

  has_and_belongs_to_many :customers, join_table: :order_customer_product
end
