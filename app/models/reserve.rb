class Reserve < ActiveRecord::Base
	has_many :soldiers
	has_one :garrison

	has_many :weapons, through: :garrison
	has_many :munitions, through: :garrison
	has_many :accessories, through: :garrison
end
