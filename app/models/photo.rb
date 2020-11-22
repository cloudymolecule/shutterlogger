class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :roll
    belongs_to :len
    belongs_to :camera
    has_one :camera_photos, through: :camera
end
