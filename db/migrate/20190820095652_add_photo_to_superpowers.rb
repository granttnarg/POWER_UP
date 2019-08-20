class AddPhotoToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :photo, :string
  end
end
