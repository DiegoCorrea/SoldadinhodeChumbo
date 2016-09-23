class AddAllocatedToWeapons < ActiveRecord::Migration
  def change
    add_column :weapons, :allocated, :boolean
  end
end
