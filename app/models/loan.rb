class Loan < ActiveRecord::Base
  belongs_to :soldier

  has_many :loan_weapons
  has_many :loan_weapon_logs
  #has_many :loan_accessories
  #has_many :loan_munitions
  has_many :weapons, through: :loan_weapons
end