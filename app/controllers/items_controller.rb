class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create!(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :freight, :shipment_source, :ship_date, :price, :brand, :buyer_id, images: []).merge(user_id: "1", category_id: "1")
  end
end
