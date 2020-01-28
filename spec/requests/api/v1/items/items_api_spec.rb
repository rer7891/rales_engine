require 'rails_helper'

describe "can find Items API" do

  describe "GET #index" do
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
