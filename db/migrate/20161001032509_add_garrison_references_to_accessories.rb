class AddGarrisonReferencesToAccessories < ActiveRecord::Migration
  def change
    add_reference :accessories, :garrison, index: true
  end
end
