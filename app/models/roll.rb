class Roll < ActiveRecord::Base
    has_many :photos
    belongs_to :camera

    validates :brand, presence: true
    validates :iso, presence: true
    validates :camera_id, presence: true
end
