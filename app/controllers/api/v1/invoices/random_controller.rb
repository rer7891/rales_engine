class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: InvoicesSerializer.new(Invoices.random_helper)
  end
end
