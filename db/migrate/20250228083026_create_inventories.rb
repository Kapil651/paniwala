class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :price
      t.integer :count
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
