class AddActiveToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :active, :bool
  end
end
