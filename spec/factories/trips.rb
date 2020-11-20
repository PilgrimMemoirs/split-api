FactoryBot.define do
  factory :trip do
    name { Faker::Marketing.buzzwords }
  end
end
