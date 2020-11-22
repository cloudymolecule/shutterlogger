class Lens < ActiveRecord::Base
    belongs_to :user
    belongs_to :camera
end
