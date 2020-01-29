FactoryBot.define do
  factory :customer, class: Customer do
    first_name        {Faker::FunnyName.name}
    last_name         {Faker::FunnyName.name}
  end
end
