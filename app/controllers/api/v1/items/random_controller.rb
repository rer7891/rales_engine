class Api::V1::Items::RandomController < ApplicationController

  def show
    render json: ItemsSerializer.new(Items.random_helper)
  end
end
