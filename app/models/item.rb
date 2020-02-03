class Item < ApplicationRecord

  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  default_scope { order("id asc") }

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('items.*, sum(invoice_items.quantity) as total_sold').merge(Transaction.successful).group(:id).reorder(total_sold: :desc).limit(quantity)
  end

  def self.best_day(id)
    id = id.to_s
   day = joins(invoices: [:invoice_items, :transactions]).select('items.*, invoices.created_at as best_day, sum(invoice_items.quantity) as total_sold').group('items.id, invoices.created_at').where('items.id = ?', id).merge(Transaction.successful).reorder('total_sold desc, best_day desc').limit(1).first
   day.best_day.strftime("%Y-%m-%d")
  end
end
