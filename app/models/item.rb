class Item < ApplicationRecord

  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  default_scope { order("id asc") }

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').merge(Transaction.successful).group(:id).order("revenue desc").limit(quantity)
  end
end
