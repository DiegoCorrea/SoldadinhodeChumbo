class Munition < ActiveRecord::Base
	validates :caliber, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }, uniqueness: { case_sensitive: false }
	validates :description, presence: true
	validates :amount, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1}
	
	belongs_to :garrison
end
