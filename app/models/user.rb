class User < ActiveRecord::Base
    has_many :cameras
    has_many :lens
    has_many :rolls
    has_many :photos

    has_secure_password
    validates :password, length: {minimum: 6}, allow_blank: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    
end
