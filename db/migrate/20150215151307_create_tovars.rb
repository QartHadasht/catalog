class CreateTovars < ActiveRecord::Migration
  def change
    create_table :tovars do |t|
      t.string :name
      t.text :description
      t.string :art
      t.integer :price
      t.integer :cat_id

      t.timestamps null: false
    end
  end
end
