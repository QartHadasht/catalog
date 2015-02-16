class Addtovaridtopic < ActiveRecord::Migration
  def change
    add_column :pics, :tovar_id, :integer
  end
end
