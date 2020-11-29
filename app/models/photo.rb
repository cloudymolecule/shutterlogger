class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :roll
    belongs_to :len
    belongs_to :camera

    validates :name, presence: true
    validates :rating, presence: true
    validates :camera_id, presence: true
    validates :len_id, presence: true
    validates :roll_id, presence: true

end