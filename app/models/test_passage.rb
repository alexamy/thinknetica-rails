class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  SUCCESSFUL_PERCENT_MARGIN = 85

  def completed?
    current_question.nil?
  end

  def current_question_index
    test.questions.ids.index(current_question.id)
  end

  def success_percent
    percentage = correct_questions / test.questions.size.to_f
    (percentage * 100).to_i
  end

  def successful?
    success_percent >= SUCCESSFUL_PERCENT_MARGIN
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  private

  def before_validation_set_current_question
    if self.current_question
      self.current_question = next_question
    else
      self.current_question = test.questions.first if test.present?
    end
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.blank?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
