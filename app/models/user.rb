class User < ApplicationRecord
  has_many :tests, through: :user_tests
  has_many :user_tests, dependent: :destroy

  def find_user_tests_by_level(level)
    tests.where(level: level)
  end
end
