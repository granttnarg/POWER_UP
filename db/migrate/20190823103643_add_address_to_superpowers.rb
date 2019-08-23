class AddAddressToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :address, :string
  end
end
