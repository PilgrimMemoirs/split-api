require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:trip) }
  it { should belong_to(:guest) }
  it { should validate_presence_of(:nights) }
  it { should validate_presence_of(:paid) }
end
