FactoryBot.define do
  factory :sale do |s|
    s.buyer 'Snake Plissken'
    s.description 'R$20 Sneakers for R$5'
    s.price 5.0
    s.quantity 4
    s.address '123 Fake St'
    s.provider 'Store Emporium'
  end
end
