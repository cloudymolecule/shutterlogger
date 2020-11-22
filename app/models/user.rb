class User < ActiveRecord::Base
    has_many :cameras
    has_many :lenses
    has_many :rolls
    has_many :photos

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
end
