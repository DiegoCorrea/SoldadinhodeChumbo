class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :soldier, index: true

      t.timestamps null: false
    end
  end
end
