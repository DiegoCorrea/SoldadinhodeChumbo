class Accessory < ActiveRecord::Base
	validates :description, presence: true, length: { maximum: 255 }
	validates :allocated, inclusion: { in: [ true, false ] }

	has_many :reserve_material
end