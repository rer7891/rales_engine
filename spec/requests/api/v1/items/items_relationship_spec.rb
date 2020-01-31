require 'rails_helper'

describe "item relationship endpoints" do
  it "GET /api/v1/items/:id/invoice_items returns a collection of associated invoice items" do
    item = create(:item)
    item_2 = create(:item)
    invoice_item = create(:invoice_items, item: item)
    invoice_item_2 = create(:invoice_items, item: item)
    invoice_item_2 = create(:invoice_items, item: item_2)

    get "/api/v1/items/#{item.id}/invoice_items"
    expect(response).to have_http_status(:success)
    item = JSON.parse(response.body)["data"]
    expect(item.count).to eq(2)
  end

  it "GET /api/v1/items/:id/merchant returns the associated merchant " do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to have_http_status(:success)
    merchant_json = JSON.parse(response.body)["data"]
    expect(merchant_json["id"]).to eq(merchant.id.to_s)
  end
end
