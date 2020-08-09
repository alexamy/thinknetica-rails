class RemoveUserIdFromAnswers < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :answers, :user_id
  end

  def self.down
    add_column :answers, :user_id, :integer
  end
end
