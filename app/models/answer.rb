class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :answers_length

  private

  def answers_length
    errors.add(:answers, "не больше 4") if question.answers.length > 3
  end
end
