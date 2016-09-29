class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.string :function
      t.string :warName
      t.references :reserve, index: true

      t.timestamps null: false
    end
  end
end
