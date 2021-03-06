FactoryBot.define do
  factory :item, class: Item do
    sequence(:name)   {|n| "#{Faker::Commerce.product_name} #{n}"}
    description       {Faker::Lorem.sentence}
    unit_price             {rand(100..10000)}

    association      :merchant, factory: :merchant1
  end
end
