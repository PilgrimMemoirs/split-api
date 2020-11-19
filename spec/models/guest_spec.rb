require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many(:bookings) }
  it { should have_many(:trips) }
  it { should validate_presence_of(:name) }
end
