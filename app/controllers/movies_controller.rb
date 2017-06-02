class MoviesController < ApplicationController
 def index
  if params["movie"] != nil
    puts "were in params"
    @movies = Movie.sort_movies_by(params["movie"].values_at("sort")[0])
  else
    puts "were out of params"
   @sorted_movies = Movie.all.to_a.sort_by(&:average_rating).reverse!
   @movies = @sorted_movies[0..2]
  end
end


 def show
   @movie = Movie.find(params[:id])
 end

end
