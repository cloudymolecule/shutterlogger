class Camera < ActiveRecord::Base
    belongs_to :user
    has_many :lens
    has_many :rolls
    has_many :photos, through: :camera_photos
    has_many :photos, through: :rolls
end
