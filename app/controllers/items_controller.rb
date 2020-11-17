class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all
    @items = Item.includes(:images).limit(5).where(buyer_id: nil).order("id DESC")

    @images = Image.all
    # @images = @item.images
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      redirect_to new_item_path, alert: '必須項目を入力してください'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :freight, :shipment_source, :ship_date, :price, :brand, :size, :buyer_id, :category_id, images: []).merge(user_id: current_user.id)
  end

end
