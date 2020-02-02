class Api::V1::Merchants::RevenuesController < ApplicationController

    def index
      render json: {data: {attributes: {total_revenue: Merchant.revenue_date(params[:date])}}}
    end

    def show
require "pry"; binding.pry
        render json: {data: {attributes: {revenue: Merchant.revenue_date_by_merchant(params[:date], params[:id])}}}
    end
end
