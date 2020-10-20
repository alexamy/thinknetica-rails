class AddCompletionTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :completion_time, :integer, default: 0
  end
end
