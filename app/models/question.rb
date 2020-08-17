class Question < ApplicationRecord
  belongs_to :test

  validates :body, presence: true
end
