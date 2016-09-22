class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.integer :serialNumber
      t.string :model
      t.string :factory

      t.timestamps null: false
    end
  end
end
