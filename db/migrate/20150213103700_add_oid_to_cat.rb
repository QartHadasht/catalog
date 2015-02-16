class AddOidToCat < ActiveRecord::Migration
  def change
    add_column :cats, :oid, :integer
  end
end
