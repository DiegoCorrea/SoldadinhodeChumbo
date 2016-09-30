class AddReferenceGarrisonToMunition < ActiveRecord::Migration
  def change
    add_reference :munitions, :garrison, index: true
  end
end
