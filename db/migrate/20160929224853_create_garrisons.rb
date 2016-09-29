class CreateGarrisons < ActiveRecord::Migration
  def change
    create_table :garrisons do |t|
      t.references :reserve, index: true

      t.timestamps null: false
    end
  end
end
