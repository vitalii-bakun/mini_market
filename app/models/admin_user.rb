class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :products

  enum role: %i[administrator moderator]
end
