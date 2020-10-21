class Badge < ApplicationRecord
  has_many :badge_rewards
  has_many :users, through: :badge_rewards

  belongs_to :test_first_try, class_name: 'Test', optional: true
  belongs_to :category, optional: true

  validates_presence_of :name, :filename
  validate :validate_presence_of_condition

  private

  def validate_presence_of_condition
    has_condition = level.positive? || category || test_first_try
    errors.add(:badge_rewards, 'должен иметь категорию, или тест, или уровень') unless has_condition
  end
end
