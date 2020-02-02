class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.find_fav_customer(params[:id]))
  end
end
