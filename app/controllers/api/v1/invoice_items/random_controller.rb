class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    render json: InvoiceItemsSerializer.new(InvoiceItems.random_helper)
  end
end
