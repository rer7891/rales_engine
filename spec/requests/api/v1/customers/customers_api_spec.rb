require 'rails_helper'

describe "can find Customers api" do

  describe "GET #index" do
    it "returns http success" do
      create(:customer)
      create(:customer)
      create(:customer)

      get '/api/v1/customers'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      id = create(:customer).id

      get "/api/v1/customers/#{id}"

      expect(response).to have_http_status(:success)
    end
  end

end
