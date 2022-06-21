class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "製作中"
      @order.order_status = "製作中"
      @order.save
    end




  end

  private

    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end

end
