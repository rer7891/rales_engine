class Api::V1::Customers::MerchantsController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_fav_merchant(params[:id]))
  end
end
