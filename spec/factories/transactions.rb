FactoryBot.define do
  factory :transaction do
    company { nil }
    article { nil }
    amount { 1 }
    status { 1 }
    transaction_time { "2020-11-17 11:50:34" }
  end
end
