class AddStringToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :unit_price, :string
  end
end
