class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create
  before_update :set_success

  SUCCESS_RATIO = 85

  def completed?
    time_over? || current_question.nil?
  end

  def success?
    passed_percents >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    if time_over?
      self.current_question = nil
      return
    end
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def passed_percents
    ((correct_questions.to_f / test.questions.count) * 100.0).round
  end

  def current_question_idx
    test.questions.order(:id).index(current_question) + 1
  end

  def remaining_time
    (test.timer - (Time.current - created_at).seconds).to_i
  end

  def time_over?
    remaining_time <= 0
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def set_success
    self.successful = success? if completed?
  end
end
