require 'faker'

10.times do
  Trip.create!(name: Faker::Hipster.sentence)
end

20.times do
  Guest.create!(
    email: Faker::Internet.email,
    name: Faker::FunnyName.name
  )
end


50.times do
  Booking.create!(
    trip_id: rand(1..10),
    guest_id: rand(1..20),
    nights: Array.new(rand(1..5)) { rand(1..7)}
  )
end
