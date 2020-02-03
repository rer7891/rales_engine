class Api::V1::Merchants::RevenuesController < ApplicationController

    def index
      render json: {data: {attributes: {total_revenue: Merchant.revenue_date(params[:date])}}}
    end

    def show
      if params[:date] != nil
        render json: {data: {attributes: {revenue: Merchant.revenue_date_by_merchant(params[:date], params[:id])}}}
      else
        render json: {data: {attributes: {revenue: Merchant.most_revenue_by_merchant(params[:id])}}}
      end
    end
end
