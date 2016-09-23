class AddAllocatedToMunitions < ActiveRecord::Migration
  def change
    add_column :munitions, :allocated, :boolean
  end
end
