class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :superpower, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
