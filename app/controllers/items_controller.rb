class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.where(buyer_id: nil)
    @images = Image.all

    @brand = Item.where(brand: 'ナイキ')
  end

  def new
  end
end
