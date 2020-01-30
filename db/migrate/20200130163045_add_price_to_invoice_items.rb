class AddPriceToInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    change_column :invoice_items, :unit_price, :string
  end
end
