class AddLongitudeToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :longitude, :float
  end
end
