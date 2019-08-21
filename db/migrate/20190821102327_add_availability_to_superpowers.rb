class AddAvailabilityToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :availability, :boolean
  end
end
