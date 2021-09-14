class Badge < ApplicationRecord

  RULES = %i[by_category by_level first_time_try].freeze

  validates :title, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
