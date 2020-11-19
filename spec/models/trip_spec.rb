require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:bookings).dependent(:destroy) }
  it { should have_many(:guests) }
  it { should validate_presence_of(:name) }
end
