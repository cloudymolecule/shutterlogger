class Camera < ActiveRecord::Base
    belongs_to :user
    has_many :lenses
    has_many :rolls
    has_many :camera_photos
    has_many :photos, through: :rolls
end
