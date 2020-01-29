FactoryBot.define do
  factory :invoice_items, class: InvoiceItem do
    quantity   {rand(1..100)}
    unit_price {rand(100..10000)}

    association :item, factory: :item
    association :invoice, factory: :invoice
  end
end
