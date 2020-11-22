class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.integer :exp_count
      t.integer :iso
      t.string :brand
      t.string :comments
      t.integer :camera_id
      t.integer user_id
      t.timestamps null: false
    end
  end
end
