class Public::ItemsController < ApplicationController

  def index
     @items = Item.page(params[:page]).per(8)
     @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem.new

    @genres = Genre.all
    #@genre = Genre.find(params[:id])
  end

 private
 def item_params
  params.require(:items).permit(:genre_id, :name, :introduction, :item_image, :price)
 end

end
