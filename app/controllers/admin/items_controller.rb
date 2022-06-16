class Admin::ItemsController < ApplicationController

  before_action :set_genres, only: [:index, :new, :show, :edit, :create, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active)
  end

  def set_genres
    @genres = Genre.all
  end

end
