class Weapon < ActiveRecord::Base
	validates :model, :factory, presence: true, length: { maximum: 20 }
	validates :serialNumber, presence: true, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }, :numericality => { :greater_than_or_equal_to => 1 }
end
