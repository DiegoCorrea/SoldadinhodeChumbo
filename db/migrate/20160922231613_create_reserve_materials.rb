class CreateReserveMaterials < ActiveRecord::Migration
  def change
    create_table :reserve_materials do |t|
      t.references :weapons, index: true, foreign_key: true
      t.references :accessories, index: true, foreign_key: true
      t.references :munitions, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
