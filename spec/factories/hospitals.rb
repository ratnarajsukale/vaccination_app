FactoryBot.define do
  factory :hospital do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    slots { Faker::Number.number(digits: 3) }
  end
end