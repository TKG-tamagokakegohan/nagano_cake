class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genres, only: [:index, :new, :show, :edit, :create, :update]

  def index
    @items = Item.all.page(params[:page]).per(10)
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active)
  end

  def set_genres
    @genres = Genre.all
  end

end
