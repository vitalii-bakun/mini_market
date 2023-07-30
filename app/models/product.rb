class Product < ApplicationRecord
  has_one_attached :presentation

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :body, presence: true
  validates :description, presence: true
  validates :available, inclusion: { in: [true, false] }

  has_many :orders, dependent: :nullify
  has_many :customers, through: :orders

  belongs_to :admin_user

  has_many :carts
end
