class AddPositionToCats < ActiveRecord::Migration
  def change
    add_column :cats, :position, :integer
  end
end
