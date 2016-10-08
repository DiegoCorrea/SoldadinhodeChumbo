class AddReserveToLoanWeapon < ActiveRecord::Migration
  def change
    add_reference :loan_weapons, :reserve, index: true
  end
end
