class RatingsController < ApplicationController

  def create

    movie_rating = params["rating"].values_at("rate")[0].to_i
    p movie_rating
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    Rating.create(user: @user, movie: @movie, spots: movie_rating)
    redirect_to movie_path(@movie)

  end

end
