require 'rails_helper'

 describe 'it can find invoice_items relationship endpoints' do
  it 'GET /api/v1/invoice_items/:id/invoice returns the associated invoice' do
    invoice = create(:invoice)
    invoice_item = create(:invoice_items, invoice: invoice)
      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      expect(response).to have_http_status(:success)
      invoice_item_json = JSON.parse(response.body)["data"]
      expect(invoice_item_json["id"]).to eq(invoice.id.to_s)
  end

  it 'GET /api/v1/invoice_items/:id/item returns the associated item' do
    item = create(:item)
    invoice_item = create(:invoice_items, item: item)
      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      expect(response).to have_http_status(:success)
      item_json = JSON.parse(response.body)["data"]
      expect(item_json["id"]).to eq(item.id.to_s)
  end
end
