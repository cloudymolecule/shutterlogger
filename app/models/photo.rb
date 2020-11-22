class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :roll
    belongs_to :lens
    has_one :camera, through: :camera_photos
end
