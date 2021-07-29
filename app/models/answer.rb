class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_count
    errors.add(:question, 'У одного Вопроса может быть от 1-го до 4-х ответов.') if question.answers.count >= 4
  end
end
