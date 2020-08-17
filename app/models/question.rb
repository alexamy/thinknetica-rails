class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:answers, "должны быть между 1 и 4") unless answers.length.between?(1, 4)
  end
end
