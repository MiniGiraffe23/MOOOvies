class FavoritesController < ApplicationController

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path
  end

end
