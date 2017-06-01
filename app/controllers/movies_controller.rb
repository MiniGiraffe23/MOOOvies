class MoviesController < ApplicationController
 def index

   @sorted_movies = Movie.all.to_a.sort_by(&:average_rating).reverse!
   @movies = @sorted_movies[0..2]

  end

 def show
  @movie = Movie.find(params[:id])
 end
end
