class LoanWeapon < ActiveRecord::Base
  belongs_to :loan
  belongs_to :weapon
end
