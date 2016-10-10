class CreateLoanAccessories < ActiveRecord::Migration
  def change
    create_table :loan_accessories do |t|
      t.references :loan, index: true
      t.references :accessory, index: true
      t.references :reserve, index: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
