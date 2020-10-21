class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :filename
      t.boolean :once, default: false

      t.integer :level, default: 0
      t.references :category, null: true, foreign_key: true
      t.references :test_first_try, null: true, foreign_key: { to_table: :tests }

      t.timestamps
    end
  end
end
