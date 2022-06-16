class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def quit
  end

  def edit
  end
end
