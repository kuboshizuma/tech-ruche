class FavoritesController < ApplicationController
  def create
    favorite = Favorite.find_by(user_id: @user_id, feed_id: params[:id])
    if favorite
      favorite.delete
    else
      Favorite.where(feed_id: params[:id], user_id: @user_id).create
    end
    render json: { status: 'success' }
  end
end
