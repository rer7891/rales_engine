FactoryBot.define do
  factory :random_merchant, class: Merchant do
    sequence(:name)   {Faker::FunnyName.name}
  end
end
