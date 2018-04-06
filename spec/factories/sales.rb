# frozen_string_literal: true

FactoryBot.define do
  factory :sale do
    description Faker::Commerce.product_name
    price 5.0
    quantity 4

    association :buyer, factory: :buyer
    association :provider, factory: :provider
  end
end
