class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :superpower
  has_many :reviews
  validates :date, presence: true
end
