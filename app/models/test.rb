class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy,   -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..)  }

  scope :by_category, -> category_name do
    joins(:category).where(categories: { name: category_name })
  end

  def self.titles_by_category(category_name)
    by_category(category_name).order("title DESC").pluck(:title)
  end
end
