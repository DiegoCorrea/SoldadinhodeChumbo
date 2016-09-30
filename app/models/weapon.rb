class Weapon < ActiveRecord::Base
	validates :model, :factory, presence: true, length: { maximum: 127 }
	validates :serialNumber, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1}, uniqueness: { case_sensitive: false }

	belongs_to :garrison
end
