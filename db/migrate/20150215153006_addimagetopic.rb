class Addimagetopic < ActiveRecord::Migration
  def change
    add_attachment :pics, :image
  end
end
