class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :guest

  validates_presence_of :nights, :paid
end
