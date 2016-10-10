class Soldier < ActiveRecord::Base
	validates :warName, :function, presence: true, length: { maximum: 31 }

	#relações
  belongs_to :reserve

  has_many :loans
  
	has_many :loan_weapons, through: :loans
	has_many :loan_munitions, through: :loans
	has_many :loan_accessories, through: :loans	

	has_many :loan_weapon_logs, through: :loans
	has_many :loan_munition_logs, through: :loans
	has_many :loan_accessory_logs, through: :loans	
end
