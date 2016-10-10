class CreateLoanMunitionLogs < ActiveRecord::Migration
  def change
    create_table :loan_munition_logs do |t|
      t.references :loan, index: true
      t.references :munition, index: true
      t.references :reserve, index: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
