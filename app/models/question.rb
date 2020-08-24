class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates_length_of :answers, within: 1..4
end
