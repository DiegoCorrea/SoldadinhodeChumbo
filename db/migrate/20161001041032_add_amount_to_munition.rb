class AddAmountToMunition < ActiveRecord::Migration
  def change
    add_column :munitions, :amount, :integer
  end
end
