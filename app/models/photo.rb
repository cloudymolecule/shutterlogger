class Photo < ActiveRecord::Base
    belongs_to :user
    belongs_to :roll
    has_one :lens
end
