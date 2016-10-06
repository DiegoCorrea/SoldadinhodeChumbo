class CreateLoanWeapons < ActiveRecord::Migration
  def change
    create_table :loan_weapons do |t|
      t.references :loan, index: true
      t.references :weapon, index: true

      t.timestamps null: false
    end
  end
end
