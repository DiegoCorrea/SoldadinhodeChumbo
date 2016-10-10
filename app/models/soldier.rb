class Soldier < ActiveRecord::Base
	validates :warName, :function, presence: true, length: { maximum: 31 }

	#relações
  belongs_to :reserve

  has_many :loans
  
	has_many :loan_weapons, through: :loans
	has_many :loan_munitions, through: :loans
	#has_many :loan_accessories, through: :loans	
end
