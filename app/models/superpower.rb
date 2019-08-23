class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :photo, presence: true
  validates :price, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader
  searchkick text_middle: [:name, :price]
end
