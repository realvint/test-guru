class Test < ApplicationRecord
  def self.find_by_category(title)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
