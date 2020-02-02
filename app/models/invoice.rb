class Invoice < ApplicationRecord
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant

  has_many :transactions, dependent: :destroy
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items

  enum status: %w(shipped)
  default_scope { order("id asc") }
  scope :day, ->(date) { where(date_range_formatter(date)) }

  def self.date_range_formatter(date)
    start = Time.zone.parse(date)
    end_date = start + 1.day
    { created_at: start..end_date }
  end
end
