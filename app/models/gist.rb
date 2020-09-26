class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :github_id, presence: true
end
