class AddPriceToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :price, :integer
  end
end
