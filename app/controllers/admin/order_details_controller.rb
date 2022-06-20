class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!



  private
  def oder_detail_params
     params.require(:order_detail).permit(:price, :item_count)
  end
end
