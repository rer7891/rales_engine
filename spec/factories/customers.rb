FactoryBot.define do
  factory :random_customer, class: Customer do
    first_name        {Faker::FunnyName.name}
    last_name         {Faker::FunnyName.name}
  end
end
