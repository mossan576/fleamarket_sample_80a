class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    # item = Item.create!(item_params)
    # redirect_to root_path
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      redirect_to new_item_path, alert: '必須項目を入力してください'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :freight, :shipment_source, :ship_date, :price, :brand, :size, :buyer_id, :category_id, images: []).merge(user_id: "1")
  end
end
