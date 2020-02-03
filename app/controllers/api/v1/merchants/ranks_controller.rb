class Api::V1::Merchants::RanksController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue_merchant(params[:quantity]))
  end
end
