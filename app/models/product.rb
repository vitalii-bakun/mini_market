class Product < ApplicationRecord
  has_one_attached :presentation

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :body, presence: true
  validates :available, inclusion: { in: [true, false] }
end
