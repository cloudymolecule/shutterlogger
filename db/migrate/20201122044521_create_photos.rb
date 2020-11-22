class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.string :shutter
      t.float :aperture
      t.string :focal_length
      t.string :date
      t.string :time
      t.string :location
      t.integer :rating
      t.integer :roll_id
      t.integer :len_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
