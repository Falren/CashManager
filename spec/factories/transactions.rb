FactoryBot.define do
  factory :transaction do
    status { 0 } 
    transaction_time { Time.now }
    amount { Faker::Number.number(digits: 3) }
  end
end