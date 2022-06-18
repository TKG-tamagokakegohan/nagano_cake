class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all.page(params[:page])
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
  end
end
