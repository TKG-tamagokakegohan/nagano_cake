class Public::HomesController < ApplicationController
  def top
   @itemes = Item.all.limit(4).order("created_at DESC")
   @genres = Genre.all
  end

  def about
  end
end
