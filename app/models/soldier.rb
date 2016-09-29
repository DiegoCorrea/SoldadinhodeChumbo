class Soldier < ActiveRecord::Base
	validates :warName, :function, presence: true, length: { maximum: 31 }
  belongs_to :reserve
end
