class Item < ApplicationRecord

  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  default_scope { order("id asc") }

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('items.*, sum(invoice_items.quantity) as total_sold').merge(Transaction.successful).group(:id).reorder(total_sold: :desc).limit(quantity)
  end
end
