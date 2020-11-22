FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { '121355' }
    password_confirmation { '121355' }
    status { 0 }
  end
end
