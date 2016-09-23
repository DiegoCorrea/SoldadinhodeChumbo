class AddAllocatedToAccessories < ActiveRecord::Migration
  def change
    add_column :accessories, :allocated, :boolean
  end
end
