class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices

  def self.random_helper
    count = self.count
    random_offset = rand(count)
    random_object = self.offset(random_offset).first
  end

  def self.most_revenue_merchant(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id).where(transactions: {result: "success"}).order("revenue desc").limit(quantity)
  end

  def self.revenue_date(date)
    joins(invoices: [:invoice_items, :transactions]).select('merchants.id, invoices.created_at as date, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id, "date").where(transactions: {result: "success"}).merge(Invoice.day(date)).reorder("revenue desc")
  end


end
