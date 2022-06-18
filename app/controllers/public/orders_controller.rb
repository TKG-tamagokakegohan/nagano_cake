class Public::OrdersController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
     @items = Item.all
  end

  def log
  end

  def thanks
  end

    private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
