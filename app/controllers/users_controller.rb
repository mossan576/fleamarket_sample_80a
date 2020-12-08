class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
    @favorite_list = Item.find(favorites)
  end

  def edit
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
    @favorite_list = Item.find(favorites)
  end

  def listed_items
    @listed_items = Item.where(user_id: current_user.id)
  end

  def purchased_items
    @purchased_items = Item.where(buyer_id: current_user.id)
  end

end
