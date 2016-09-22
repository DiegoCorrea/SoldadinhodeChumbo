class CreateMunitions < ActiveRecord::Migration
  def change
    create_table :munitions do |t|
      t.integer :caliber
      t.text :description

      t.timestamps null: false
    end
  end
end
