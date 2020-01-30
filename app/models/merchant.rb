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

  def self.most_revenue(quantity)
 #    require "pry"; binding.pry
 #    joins(invoices: [:invoice_items, :transactions]).select('merchants.*, sum(invoice_items.quantity * invoi
 # ce_items.unit_price) as revenue').group(:id).merge(Transaction.successful).order("revenue desc").limit(2)
  end
end
