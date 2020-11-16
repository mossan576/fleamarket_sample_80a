class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.includes(:images).limit(5).where(buyer_id: nil).order("id DESC")

    @images = Image.all
    # @images = @item.images
  end

  def new
  end
end
