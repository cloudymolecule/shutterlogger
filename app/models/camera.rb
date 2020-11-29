class Camera < ActiveRecord::Base
    belongs_to :user
    has_many :lens
    has_many :rolls
    has_many :photos, through: :rolls
    has_many :photos
    
    validates :make, presence: true
    validates :model, presence: true
end