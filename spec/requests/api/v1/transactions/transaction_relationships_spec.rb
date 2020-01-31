require 'rails_helper'

describe 'transactions relationship endpoints' do
  it "can GET /api/v1/transactions/:id/invoice" do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)
    invoice_3 = create(:invoice)
    transaction = create(:transactions, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"
    expect(response).to have_http_status(:success)
    invoice_json = JSON.parse(response.body)["data"]
    expect(invoice_json["id"]).to eq(invoice.id.to_s)
  end
end
