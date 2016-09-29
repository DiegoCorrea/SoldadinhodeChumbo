class Munition < ActiveRecord::Base
	validates :caliber, presence: true, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }, :numericality => { :greater_than_or_equal_to => 1 }
	validates :description, presence: true
	
end
