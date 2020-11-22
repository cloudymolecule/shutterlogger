class User < ActiveRecord::Base
    has_many :cameras
    has_many :lenses
    has_many :rolls
    has_many :photos
end
