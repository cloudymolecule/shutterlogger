class Len < ActiveRecord::Base
    belongs_to :user
    belongs_to :camera

    validates :make, presence: true
    validates :model, presence: true
    validates :focal_range, presence: true
    validates :min_aperture, presence: true
    validates :max_aperture, presence: true
end
