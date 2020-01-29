require 'csv'

desc "Import data from csv files"
task :import => [:environment] do

  Customer.destroy_all
  Merchant.destroy_all
  Item.destroy_all
  Invoice.destroy_all
  InvoiceItem.destroy_all
  Transaction.destroy_all

  customers = "db/data/customers.csv"
  invoice_items = "db/data/invoice_items.csv"
  invoices = "db/data/invoices.csv"
  items = "db/data/items.csv"
  merchants = "db/data/merchants.csv"
  transactions = "db/data/transactions.csv"

  CSV.foreach(customers, headers: true) do |row|
    Customer.create(row.to_hash)
  end

  CSV.foreach(merchants, headers: true) do |row|
    Merchant.create(row.to_hash)
  end

  CSV.foreach(items, headers: true) do |row|
    Item.create(row.to_hash)
  end

  CSV.foreach(invoices, headers: true) do |row|
    Invoice.create(row.to_hash)
  end

  CSV.foreach(invoice_items, headers: true) do |row|
    InvoiceItem.create(row.to_hash)
  end

  CSV.foreach(transactions, headers: true) do |row|
    Transaction.create(row.to_hash)
  end
end
