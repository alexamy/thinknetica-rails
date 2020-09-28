class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :github_id, presence: true

  def url
    "https://gist.github.com/#{github_id}"
  end
end
