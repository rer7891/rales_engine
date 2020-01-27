class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :unit_price
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
