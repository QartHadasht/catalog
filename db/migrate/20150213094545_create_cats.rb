class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :fold, :default => 0

      t.timestamps null: false
    end
    add_reference :cats, :cat, index: true, :default => 0
  end
end
