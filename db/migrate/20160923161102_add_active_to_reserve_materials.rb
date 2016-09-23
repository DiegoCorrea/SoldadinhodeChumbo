class AddActiveToReserveMaterials < ActiveRecord::Migration
  def change
    add_column :reserve_materials, :active, :boolean
  end
end
