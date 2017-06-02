class WatchlistsController < ApplicationController

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    redirect_to user_path
  end

end
