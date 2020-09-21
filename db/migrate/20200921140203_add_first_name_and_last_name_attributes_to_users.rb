class AddFirstNameAndLastNameAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :first_name
    change_column_null :users, :first_name, true

    add_column :users, :last_name, :string

    rename_column :users, :user_type, :type
    change_column_default :users, :type, from: nil, to: 'User'
    add_index :users, :type
  end
end
