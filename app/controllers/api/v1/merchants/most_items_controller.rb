class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_items_merchant(params[:quantity]))
  end
end
