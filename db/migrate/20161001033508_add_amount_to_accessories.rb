class AddAmountToAccessories < ActiveRecord::Migration
  def change
    add_column :accessories, :amount, :integer
  end
end
