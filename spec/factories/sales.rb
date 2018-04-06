FactoryBot.define do
  factory :sale do
    description 'R$20 Sneakers for R$5'
    price 5.0
    quantity 4

    association :buyer, factory: :buyer
    association :provider, factory: :provider
  end
end
