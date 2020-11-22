class Roll < ActiveRecord::Base
    has_many :photos
    belongs_to :camera
end
