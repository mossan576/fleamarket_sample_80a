class ItemsController < ApplicationController
  def index
    # @items = Item.all
    # @items = Item.limit(5).where(buyer_id: nil).order("id DESC")
    @items = Item.includes(:images).limit(5).where(buyer_id: nil).order("id DESC")

    @images = Image.all
  end

  def create
  end

  def new
  end
end
