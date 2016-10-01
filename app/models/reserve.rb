class Reserve < ActiveRecord::Base
	has_many :soldiers, :dependent => :destroy

	
	has_one :garrison, :dependent => :destroy

	has_many :weapons, through: :garrison, :dependent => :destroy
	has_many :munitions, through: :garrison, :dependent => :destroy
	has_many :accessories, through: :garrison, :dependent => :destroy
end
