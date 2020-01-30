require 'rails_helper'

describe "can find Items API" do

  describe "GET #index" do
    it "sends a list of items" do
      create(:item)
      create(:item)
      create(:item)
      create(:item)

      get "/api/v1/items"
      expect(response).to have_http_status(:success)
      items = JSON.parse(response.body)["data"]

      expect(items.count).to eq(4)
    end
  end
    describe "GET #show" do
      it "sends a single item" do
        item_1 = create(:item)
        create(:item)
        create(:item)
        create(:item)

        get "/api/v1/items/#{item_1.id}"
        expect(response).to have_http_status(:success)
        item = JSON.parse(response.body)["data"]

        expect(item["id"]).to eq(item_1.id.to_s)
      end
  end

  describe "GET #index for merchant items" do
    it "sends a list of items" do
      merchant = create(:merchant1)
      merchant_2 = create(:merchant)

      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant_2)

      get "/api/v1/merchants/#{merchant.id}/items"
      expect(response).to have_http_status(:success)
      items = JSON.parse(response.body)["data"]

      expect(items.count).to eq(4)
    end
  end
end
