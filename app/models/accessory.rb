class Accessory < ActiveRecord::Base
	validates :description, presence: true, length: { maximum: 255 }
	validates :amount, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 0}

	belongs_to :garrison
end