class Soldier < ActiveRecord::Base
	validates :warName, :function, presence: true, length: { maximum: 31 }

	has_many :loans
	has_many :loans_weapons, through: :loans, :dependent => :destroy
	has_many :loans_accessories, through: :loans, :dependent => :destroy
	has_many :loans_munitions, through: :loans, :dependent => :destroy

  belongs_to :reserve
end
