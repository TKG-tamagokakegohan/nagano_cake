class Public::ItemsController < ApplicationController
  def index
    @itemes = Item.all
  end

  def show
    @item = Item.new
    @genres = Genre.all
  end

end
