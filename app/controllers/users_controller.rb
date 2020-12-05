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
end
