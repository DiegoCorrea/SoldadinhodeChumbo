class Accessory < ActiveRecord::Base
	validates :description, presence: true, length: { maximum: 255 }

	belongs_to :garrison
end