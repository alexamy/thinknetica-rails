class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :users, :through => :user_tests

  def self.by_category(category_name)
    category = Category.find_by(name: category_name)
    Test.where(category: category).order("title DESC")
  end
end
