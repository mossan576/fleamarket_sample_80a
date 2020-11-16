class ImagesController < ApplicationController
  def index
    # Item.index(item_params)
    # @items = Item.all
    # @images = Image.all
    # @images = @item.images
    # @images = @item.images
    # @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:image).merge(item_id: params[:item_id])
  end
end


