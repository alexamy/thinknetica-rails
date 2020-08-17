class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :easy,   -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..)  }

  scope :by_category, -> category_name do
    joins(:category)
    .where(categories: { name: category_name })
    .order("title DESC")
    .pluck(:title)
  end
end
