class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.limit(5).order("id DESC")
    @categories = Category.all
    @favorites = Favorite.all
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

  def show
    @related_items = Item.find(params[:id])
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to item_path(@item.id), alert: 'エラーが発生しました'
    end
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    edit_images
    if @item.images.length <= 10 && @item.images.length > 0
      if @item.update(update_params)
        redirect_to item_path(@item.id), notice: '編集が完了しました'
      else
        redirect_to edit_item_path, alert: '必須項目を入力してください'
      end
    else
      redirect_to edit_item_path, alert: '画像は1枚以上10枚以下です'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :status, :freight, :shipment_source, :ship_date, :price, :brand, :size, :buyer_id, :category_id, images: []).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :description, :status, :freight, :shipment_source, :ship_date, :price, :brand, :size, :buyer_id, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_images
    delete_images
    add_images
  end

  def delete_images
    if params[:item][:image_ids]
      params[:item][:image_ids].each do |image_id|
        image = @item.images.find(image_id)
        image.purge
      end
    end
  end

  def add_images
    if (params[:item][:images]).presence
      @item.images.attach(params[:item][:images])
    end
  end
  

end
