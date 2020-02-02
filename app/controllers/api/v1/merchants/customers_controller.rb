class Api::V1::Merchants::CustomersController < ApplicationController
  def index
    render json: CustomerSerializer.new(Customer.find_pending_invoices(params[:id]))
  end

  def show
    render json: CustomerSerializer.new(Customer.find_fav_customer(params[:id]))
  end
end
