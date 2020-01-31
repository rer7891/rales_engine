require 'rails_helper'

 describe 'it can find invoice_items relationship endpoints' do

    it 'GET /api/v1/invoices/:id/transactions returns a collection of associated transactions' do
      invoice = create(:invoice)
      invoice_2 = create(:invoice)

      transaction = create(:transactions, invoice: invoice)
      transaction = create(:transactions, invoice: invoice)
      transaction = create(:transactions, invoice: invoice_2)
      get "/api/v1/invoices/#{invoice.id}/transactions"

      expect(response).to have_http_status(:success)
      invoice_json = JSON.parse(response.body)["data"]
      expect(invoice_json.count).to eq(2)
    end

    it 'Get /api/vi/invoices/:id /invoice_items returns a collection of associated invoice_items' do
      item = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      invoice = create(:invoice)
      invoice_item = create(:invoice_items, invoice: invoice, item: item, quantity: 2, unit_price: 22.34)
      invoice_item_2 = create(:invoice_items, invoice: invoice, item: item_2, quantity: 4, unit_price: 25.34)
      invoice_item_3 = create(:invoice_items, invoice: invoice, item: item_3, quantity: 1, unit_price: 28.34)


      get "/api/v1/invoices/#{invoice.id}/invoice_items"
      expect(response).to have_http_status(:success)
      invoice_json = JSON.parse(response.body)["data"]
      expect(invoice_json.count).to eq(3)
    end

    it 'GET /api/v1/invoices/:id/items returns a collection of associated items' do
      item = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      invoice = create(:invoice)
      invoice_item = create(:invoice_items, invoice: invoice, item: item, quantity: 2, unit_price: 22.34)
      invoice_item_2 = create(:invoice_items, invoice: invoice, item: item_2, quantity: 4, unit_price: 25.34)
      invoice_item_3 = create(:invoice_items, invoice: invoice, item: item_3, quantity: 1, unit_price: 28.34)


      get "/api/v1/invoices/#{invoice.id}/items"
      expect(response).to have_http_status(:success)
      invoice_json = JSON.parse(response.body)["data"]
      expect(invoice_json.count).to eq(3)
    end

    it ' GET /api/v1/invoices/:id/customer returns the associated customer' do
      customer = create(:customer)
      customer_2 = create(:customer)
      invoice = create(:invoice, customer: customer)

      get "/api/v1/invoices/#{invoice.id}/customer"
      expect(response).to have_http_status(:success)
      invoice_json = JSON.parse(response.body)["data"]
      expect(invoice_json.class).to eq(Hash)
    end

    it 'GET /api/v1/invoices/:id/merchant returns the associated merchant' do
      merchant = create(:merchant)
      merchant_2 = create(:merchant)
      invoice = create(:invoice, merchant: merchant)

      get "/api/v1/invoices/#{invoice.id}/merchant"
      expect(response).to have_http_status(:success)
      invoice_json = JSON.parse(response.body)["data"]
      expect(invoice_json.class).to eq(Hash)
    end
end
