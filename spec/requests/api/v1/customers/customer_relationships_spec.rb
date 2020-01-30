require 'rails_helper'

describe 'it can find customer relationship endpoints' do
  it 'GET /api/v1/customers/:id/invoices returns a collection of associated invoices' do
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer)
    invoice_3 = create(:invoice, customer: customer_2)

    get "/api/v1/customers/#{customer.id}/invoices"
      expect(response).to have_http_status(:success)
      customer = JSON.parse(response.body)["data"]

      expect(customer.count).to eq(2)
  end

  it 'GET /api/v1/customers/:id/transactions returns a collection of associated transactions' do
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer_2)

    transaction = create(:transactions, invoice: invoice)
    transaction_2 = create(:transactions, invoice: invoice)
    transaction_3 = create(:transactions, invoice: invoice)
    transaction_2 = create(:transactions, invoice: invoice_2)

    get "/api/v1/customers/#{customer.id}/transactions"
      expect(response).to have_http_status(:success)
      customer = JSON.parse(response.body)["data"]
      expect(customer.count).to eq(3)
  end
end
