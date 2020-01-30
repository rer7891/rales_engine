require 'rails_helper'

describe "can get business endpoints" do

  describe "merchant business endpoints" do
    it "GET /api/v1/merchants/most_revenue?quantity=2" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      merchant_3 = create(:merchant)
      merchant_4 = create(:merchant)
      merchant_5 = create(:merchant)
      create_list(:item, 5, merchant: merchant_1)
      create_list(:item, 5, merchant: merchant_2)
      create_list(:item, 5, merchant: merchant_3)
      create_list(:item, 5, merchant: merchant_4)
      create_list(:item, 5, merchant: merchant_5)
      merchants = [merchant_1, merchant_2, merchant_3, merchant_4, merchant_5]

      merchants.each do |merchant|
        invoice = create(:invoice, merchant: merchant)
        transaction = create(:transactions, invoice: invoice)
        merchant.items.each do |item|
          create(:invoice_items, quantity: 2, unit_price: "23.50", item: item, invoice: invoice)
        end
      end
      get '/api/v1/merchants/most_revenue?quantity=2'

    end
  end
end
