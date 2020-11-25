class CreateLens < ActiveRecord::Migration
  def change
    create_table :lens do |t|
      t.string :make
      t.string :model
      t.string :focal_range
      t.string :max_aperture
      t.string :min_aperture
      t.integer :camera_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
