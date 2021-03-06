class Loan < ActiveRecord::Base
  belongs_to :soldier

  has_many :loan_weapons
  has_many :loan_weapon_logs
  has_many :loan_munitions
  has_many :loan_munition_logs
  has_many :loan_accessories
  has_many :loan_accessory_logs

  has_many :weapons, through: :loan_weapons
  has_many :munitions, through: :loan_munitions
  has_many :accessories, through: :loan_accessories
end