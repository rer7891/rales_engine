class Api::V1::Merchants::RandomController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.random_helper)
  end
end
