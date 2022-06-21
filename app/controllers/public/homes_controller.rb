class Public::HomesController < ApplicationController
  def top
   @itemes = Item.all

  end

  def about
  end
end
