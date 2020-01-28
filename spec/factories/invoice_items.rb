FactoryBot.define do
  factory :random_invoice_items, class: InvoiceItem do
    quantity   {rand(1..100)}
    unit_price {rand(100..10000)}

    association :item, factory: :random_item
    association :invoice, factory: :random_invoice
  end
end
