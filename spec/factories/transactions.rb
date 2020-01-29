FactoryBot.define do
  factory :transactions, class: Transaction do
    credit_card_number           {rand(100..10000)}
    credit_card_expiration_date  {rand(100..10000)}
    result                       {"success"}

    association   :invoice, factory: :invoice
  end
end
