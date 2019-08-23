class AddLatitudeToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :latitude, :float
  end
end
