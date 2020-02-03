class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.random_helper
    count = self.count
    random_offset = rand(count)
    random_object = self.offset(random_offset).first
  end

  def self.most_revenue_merchant(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id).where(transactions: {result: "success"}).reorder("revenue desc").limit(quantity)
  end

  def self.most_revenue_by_merchant(id)
    id = id.to_s
    x = joins(invoices: [:invoice_items, :transactions]).select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id).where("merchants.id = ?", id).merge(Transaction.successful).reorder("revenue desc").first
    x.revenue.to_s
  end

  def self.most_items_merchant(quantity)
    joins(invoices: [:invoice_items, :transactions]).select('merchants.*, sum(invoice_items.quantity) as total_sold').group(:id).where(transactions: {result: "success"}).reorder("total_sold desc").limit(quantity)
  end

  def self.revenue_date(date)
    merchants = joins(invoices: [:invoice_items, :transactions]).select('merchants.id, invoices.created_at as date, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id, "date").where(transactions: {result: "success"}).merge(Invoice.day(date)).reorder("revenue desc")
    merchants.sum { |merchant| merchant.revenue }.to_s
  end

  def self.revenue_date_by_merchant(date, id)
    id = id.to_s
    merchant = joins(invoices: [:invoice_items, :transactions]).select('merchants.*, invoices.created_at as date, sum(invoice_items.quantity * invoice_items.unit_price) as revenue').group(:id, "date").where("merchants.id = ?", id).merge(Transaction.successful).merge(Invoice.day(date)).reorder("revenue desc").first
    merchant.revenue.to_s
  end

  def self.find_fav_merchant(id)
  id = id.to_s
  joins(invoices: [:customer, :transactions]).select('merchants.*, count(transactions.result) as results').group(:id).where('invoices.customer_id = ?', id).merge(Transaction.successful).reorder('results desc').limit(1).first
  end
end
