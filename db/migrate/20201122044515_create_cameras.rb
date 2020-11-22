class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :nickname
      t.string :make
      t.string :model
      t.boolean :loaded
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
