class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.random_helper)
  end
end