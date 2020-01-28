FactoryBot.define do
  factory :random_invoice, class: Invoice do
    status      {"shipped"}

    association :customer, factory: :random_customer
    association :merchant, factory: :random_merchant
  end
end
