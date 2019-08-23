class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :photo, presence: true
  validates :price, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # searchkick text_middle: [:name, :price]

  include PgSearch::Model
   pg_search_scope :search_by_name_and_price,
    against: [ :name, :price, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
