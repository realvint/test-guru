class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                    uniqueness: { scope: :title }

  scope :easy, -> { where(level: 0..1) }
  scope :norm, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.find_by_category(title)
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
