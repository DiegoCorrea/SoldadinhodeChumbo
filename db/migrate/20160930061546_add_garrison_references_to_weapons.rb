class AddGarrisonReferencesToWeapons < ActiveRecord::Migration
  def change
    add_reference :weapons, :garrison, index: true
  end
end
