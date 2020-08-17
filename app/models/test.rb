class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.by_category(category_name)
    Test
      .joins(:category)
      .where(categories: { name: category_name })
      .order("title DESC")
      .pluck(:title)
  end
end
