class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
