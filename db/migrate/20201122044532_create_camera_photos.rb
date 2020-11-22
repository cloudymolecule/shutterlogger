class CreateCameraPhotos < ActiveRecord::Migration
  def change
    create_table :camera_photos do |t|
      t.integer :camera_id
      t.integer :photo_id
      t.timestamps null: false
    end
  end
end
