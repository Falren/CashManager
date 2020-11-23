# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    name { Faker::Kpop.girl_groups }
  end
end
