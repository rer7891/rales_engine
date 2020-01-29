require 'rails_helper'

describe 'Invoice API' do

  describe "GET #index" do
    it "returns http success" do
      create(:invoice)
      create(:invoice)
      create(:invoice)

      get '/api/v1/invoices'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      id = create(:invoice).id
      get "/api/v1/invoices/#{id}"
      expect(response).to have_http_status(:success)
    end
  end

end
