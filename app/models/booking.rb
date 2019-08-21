class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :superpower
  has_one :review
  validates :date, presence: true
end
