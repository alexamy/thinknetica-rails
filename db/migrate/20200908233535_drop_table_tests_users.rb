class DropTableTestsUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_tests, if_exist: true
  end

  def down
  end
end
