class Public::ItemsController < ApplicationController
  def index
     @items = Item.all
     @genres = Genre.all
  end

  def show
    @genres = Genre.all
  end

end
