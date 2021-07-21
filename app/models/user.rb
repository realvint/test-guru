class User < ApplicationRecord
  def find_user_tests_by_level(level)
    Test.where(level: level)
        .joins('JOIN user_tests ON user_tests.test_id = tests.id')
        .where(user_tests: { user_id: id })
  end
end
