FactoryBot.define do
  factory :merchant, class: Merchant do
    name   {Faker::FunnyName.name}
  end
end
