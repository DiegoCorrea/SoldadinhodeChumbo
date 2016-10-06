class Loan < ActiveRecord::Base
  belongs_to :soldier

  has_many :loans_weapons
  has_many :loans_accessories
  has_many :loans_munitions
end
