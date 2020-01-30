class RemoveSFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoice_items, :unit_price, :string
    add_column :invoice_items, :unit_price, :float
  end
end
