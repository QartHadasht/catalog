class AddActiveToCats < ActiveRecord::Migration
  def change
    add_column :cats, :active, :boolean, :default => true
  end
end
