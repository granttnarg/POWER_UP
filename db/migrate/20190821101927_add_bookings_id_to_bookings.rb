class AddBookingsIdToBookings < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.references :booking, foreign_key: true
    end

    change_table :bookings do |t|
      remove_column :bookings, :review_id
    end
  end
end
