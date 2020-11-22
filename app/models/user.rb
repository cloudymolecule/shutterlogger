class User < ActiveRecord::Base
    has_many :cameras
    has_many :lens
    has_many :rolls
    has_many :photos

    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
end
