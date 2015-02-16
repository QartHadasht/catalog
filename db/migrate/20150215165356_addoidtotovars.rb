class Addoidtotovars < ActiveRecord::Migration
  def change
    add_column :tovars, :oid, :integer
  end
end
