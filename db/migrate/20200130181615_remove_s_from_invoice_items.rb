class RemoveSFromInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :unit_price, :decimal, precision: 10, scale: 2
    add_column :items, :unit_price, :float
  end
end
