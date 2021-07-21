class Test < ApplicationRecord
  def self.find_by_category(title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title =?', title)
        .order('tests.title desc')
  end
end
