FactoryBot.define do
  factory :guest do
    name { Faker::FunnyName.name }
  end
end
