class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :filename
      t.string :rule
      t.string :condition

      t.timestamps
    end
  end
end
