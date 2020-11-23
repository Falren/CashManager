FactoryBot.define do
  factory :company do
    name { Faker::Name.first_name }
    country { Faker::Address.country }
    currency { Faker::Currency.code }
  end
end
