class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity

  attributes :unit_price do |invoice_item|
    invoice_item.unit_price.to_s
  end
end
