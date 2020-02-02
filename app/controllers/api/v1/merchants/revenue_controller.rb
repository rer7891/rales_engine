class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue_merchant(params[:quantity]))
  end

  def show
    render json: RevenueSerializer.new(Merchant.revenue_date(params[:date]))
  end
end
