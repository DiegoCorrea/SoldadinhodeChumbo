class Reserve < ActiveRecord::Base
	validates :initials, :description, presence: true, uniqueness: { case_sensitive: false }
	has_many :soldiers
	
	has_one :garrison

	has_many :weapons, through: :garrison
	has_many :munitions, through: :garrison
	has_many :accessories, through: :garrison
end
