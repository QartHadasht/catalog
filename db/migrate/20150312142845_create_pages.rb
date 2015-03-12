class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.string :location
      t.string :description
      t.string :keywords
      t.timestamps null: false
    end
  end
end
