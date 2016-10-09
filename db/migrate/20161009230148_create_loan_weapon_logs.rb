class CreateLoanWeaponLogs < ActiveRecord::Migration
  def change
    create_table :loan_weapon_logs do |t|
      t.references :loan, index: true
      t.references :weapon, index: true
      t.references :reserve, index: true

      t.timestamps null: false
    end
  end
end
