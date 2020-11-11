class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
    @categories = Category.all
  end

  def new
  end
end
