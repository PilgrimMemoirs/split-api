FactoryBot.define do
  factory :booking do
    paid { false }
    cost { nil }
    trip { nil }
    guest { nil }
  end
end
