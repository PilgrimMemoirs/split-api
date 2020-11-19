class Guest < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings

  validates_presence_of :name
end
