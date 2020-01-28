require 'rails_helper'

describe "can find Merchant API" do

  describe "GET #index" do
    it "sends a list of merchants" do
      create_list(:merchant, 4)

      get '/api/v1/merchants'
      expect(response).to have_http_status(:success)
      merchant = JSON.parse(response.body)["data"]

      expect(merchant.count).to eq(4)
    end
  end
end 
