# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
10.times do
  Hospital.create([{ 
    name: Faker::Company.name, 
    address: Faker::Address.street_address,
    slots: Faker::Number.number(digits: 3)
  }])
end

5.times do
  User.create([{ 
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    age: Faker::Number.number(digits: 2),
    password: 222222, 
    password_confirmation: 222222,
    staff: true
  }])
end

5.times do
  User.create([{ 
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    age: Faker::Number.number(digits: 2),
    password: 222222, 
    password_confirmation: 222222,
    staff: false
  }])
end

User.create([{ 
  name: 'admin', 
  email: 'admin@gmail.com',
  age: 48,
  password: 222222, 
  password_confirmation: 222222,
  staff: true
}])

User.create([{ 
  name: 'no_admin', 
  email: 'noadmin@gmail.com',
  age: 27,
  password: 222222, 
  password_confirmation: 222222,
  staff: false
}])


