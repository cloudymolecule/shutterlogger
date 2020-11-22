class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :roll
    has_one :lens
    has_one :camera, through: :camera_photos
end
