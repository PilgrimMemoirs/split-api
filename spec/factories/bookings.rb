FactoryBot.define do
  factory :booking do
    paid { false }
    owes { nil }
    trip { nil }
    guest { nil }
  end
end
