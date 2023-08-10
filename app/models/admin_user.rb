class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :products
  has_many :pages
  
  enum role: %i[administrator moderator]
end
