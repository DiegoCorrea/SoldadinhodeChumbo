class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.string :initials
      t.text :description

      t.timestamps null: false
    end
  end
end
