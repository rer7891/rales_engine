# GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
# GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
# GET /api/v1/invoices/:id/items returns a collection of associated items
# GET /api/v1/invoices/:id/customer returns the associated customer
# GET /api/v1/invoices/:id/merchant returns the associated merchant
require 'rails_helper'

 describe 'it can find invoice_items relationship endpoints' do
  it ' GET /api/v1/invoices/:id/transactions returns a collection of associated transactions' do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)

    transaction = create(:transactions, invoice: invoice)
    transaction = create(:transactions, invoice: invoice)
    transaction = create(:transactions, invoice: invoice_2)
    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to have_http_status(:success)

  end

  it 'GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items' do
    item = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    invoice = create(:invoice)
    invoice.items << item, item_2, item_3

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    expect(response).to have_http_status(:success)
  end

  it 'GET /api/v1/invoices/:id/items returns a collection of associated items' do
    item = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    invoice = create(:invoice)
    invoice.items << item, item_2, item_3

    get "/api/v1/invoices/#{invoice.id}/items"
    expect(response).to have_http_status(:success)
  end

  it ' GET /api/v1/invoices/:id/customer returns the associated customer' do
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"
    expect(response).to have_http_status(:success)
  end

  it 'GET /api/v1/invoices/:id/merchant returns the associated merchant' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"
    expect(response).to have_http_status(:success)
  end
end
