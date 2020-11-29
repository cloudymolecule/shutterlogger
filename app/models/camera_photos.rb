class CameraPhotos < ActiveRecord::Base
    belongs_to :camera 
    belongs_to :photo
end
