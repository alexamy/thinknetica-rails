class DropCustomUsersTestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :tests_users
  end
end
