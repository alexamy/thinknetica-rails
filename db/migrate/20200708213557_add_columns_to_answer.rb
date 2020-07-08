class AddColumnsToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :boolean)
    add_reference(:answers, :user, foreign_key: true)
  end
end
