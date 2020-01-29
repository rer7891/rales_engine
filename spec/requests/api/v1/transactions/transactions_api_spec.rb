require 'rails_helper'

describe 'Transaction API' do

  describe "GET #index" do
    it "returns http success" do
      create(:transactions)
      create(:transactions)
      create(:transactions)

      get '/api/v1/transactions'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      id = create(:transactions).id
      get "/api/v1/transactions/#{id}"
      expect(response).to have_http_status(:success)
    end
  end
end
