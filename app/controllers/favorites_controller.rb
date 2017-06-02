class FavoritesController < ApplicationController

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    Favorite.create(user: @user, movie: @movie)
    redirect_to movie_path(@movie)
  end



  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_path
  end

end
