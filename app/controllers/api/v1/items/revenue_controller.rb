class Api::V1::Items::RevenueController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.most_revenue(params[:quantity]))
  end

  def show
    render json: {data: {attributes: {best_day: Item.best_day(params[:id])}}}
  end
end
