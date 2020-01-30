require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'methods' do
    it "can get a random merchant" do
      create_list(:merchant, 20)
      first_merchant = Merchant.random_helper
      second_merchant = Merchant.random_helper
      third_merchant = Merchant.random_helper

      expect(first_merchant).not_to eq(second_merchant || third_merchant)
      expect(second_merchant).not_to eq(third_merchant)
    end
  end 
end
