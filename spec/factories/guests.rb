FactoryBot.define do
  factory :guest do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
  end
end
