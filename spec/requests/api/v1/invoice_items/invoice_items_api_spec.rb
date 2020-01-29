require 'rails_helper'

describe 'Get InvoiceItems API' do

  describe "GET #index" do
    it "returns http success" do
      create(:invoice_items)
      create(:invoice_items)
      create(:invoice_items)

      get '/api/v1/invoice_items'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      id = create(:invoice_items).id
      get "/api/v1/invoice_items/#{id}"
      expect(response).to have_http_status(:success)
    end
  end

end
