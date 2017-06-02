class WatchlistsController < ApplicationController

 def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    Watchlist.create(user: @user, movie: @movie)
    redirect_to movie_path(@movie)
  end


  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    redirect_to user_path
  end

end
