class User < ApplicationRecord
  has_many :tests, through: :user_tests
  has_many :user_tests, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def find_user_tests_by_level(level)
    tests.where(level: level)
  end
end
