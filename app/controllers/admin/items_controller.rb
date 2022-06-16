class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :item_image, :price, :is_active)
  end
end
