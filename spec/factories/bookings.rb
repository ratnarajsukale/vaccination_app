FactoryBot.define do
  factory :booking do
    date { Faker::Date.forward(days: 23) }
    association :user
    association :hospital
  end
end