class Badge < ApplicationRecord

  validates :title, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
