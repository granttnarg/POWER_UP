class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :name, presence: true
  #mount_uploader :photo, PhotoUploader
end
