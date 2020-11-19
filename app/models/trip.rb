class Trip < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings

  validates_presence_of :name
end
