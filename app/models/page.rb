class Page < ApplicationRecord
  belongs_to :admin_user
  validates :title, presence: true
  validates :body, presence: true
  validates :available, inclusion: { in: [true, false] }
end
