class AddNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :body, false)

    change_column_null(:users, :name, false)
    change_column_null(:users, :type, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password_digest, false)
  end
end
