class Api::V1::Merchants::RanksController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue_merchant(params[:quantity]))
  end

  def show
    render json: MerchantSerializer.new(Merchant.most_revenue_by_merchant(params[:id]))
  end
end
