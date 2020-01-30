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
end
