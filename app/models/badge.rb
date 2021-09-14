class Badge < ApplicationRecord

  enum rule_type: %i[by_category by_level first_time_try]

  validates :title, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
