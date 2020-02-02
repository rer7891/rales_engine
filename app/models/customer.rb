class Customer < ApplicationRecord

  validates_presence_of :first_name, :last_name

  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices

  def self.find_fav_customer(merchant_id)
    merchant = merchant_id.to_i
    joins(invoices: :transactions).select('customers.*, count(transactions.id) as total_transactions').where('invoices.merchant_id = ?', merchant).merge(Transaction.successful).group(:id).reorder("total_transactions desc").limit(1).first
  end

  def self.find_pending_invoices(merchant_id)
    merchant = merchant_id.to_i
    joins(invoices: :transactions).select('customers.*').where('invoices.merchant_id = ? AND ', merchant).merge(Transaction.successful).group(:id).reorder("total_transactions desc").limit(1).first
  end

end
