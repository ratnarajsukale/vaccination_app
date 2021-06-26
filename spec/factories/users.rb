FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    age { Faker::Number.number(digits: 2) }
    email { Faker::Internet.free_email }
    password { 'pass123456' }
    password_confirmation { 'pass123456' }
    staff { false }
  end
end