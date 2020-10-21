class AddNotifiedAtAttributeToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :completed_at, :datetime, precision: 6
  end
end
