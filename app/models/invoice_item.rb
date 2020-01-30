class InvoiceItem < ApplicationRecord
  validates_presence_of :quantity, :unit_price

  belongs_to :item
  belongs_to :invoice

  def unit_price
  #require "pry"; binding.pry
   unit_price.to_s
  end
end
