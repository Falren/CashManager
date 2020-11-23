FactoryBot.define do
  factory :article do
    name { Faker::Kpop.girl_groups }
  end
end
