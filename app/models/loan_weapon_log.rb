class LoanWeaponLog < ActiveRecord::Base
  belongs_to :loan
  belongs_to :weapon
  belongs_to :reserve
end
