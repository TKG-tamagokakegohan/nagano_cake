class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "製作中"
      #@order.order_status = "製作中"
      #@order.save
      @order.update(order_status: "製作中")
    end

    if @order.order_details.count == @order.order_details.where(making_status: "製作完了").count
      @order.update(order_status: "発送準備中")
    end

    redirect_to admin_order_path(@order)


  end

  private

    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end

end
