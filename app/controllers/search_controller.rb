class SearchController < ApplicationController
  def show

    p params
    p params[:search]

    if params[:search] == "Movie"
      if params[:m] != nil && params[:m].length > 0
      puts "in movie"
      search = params[:m].downcase
      @movie_results = Movie.where('LOWER(title) LIKE ?', "%#{search}%")
      end

    else
      if params[:m] != nil && params[:m].length > 0
      puts "in director"
      search = params[:m].downcase
      @director_results = Movie.where('LOWER(director) LIKE ?', "%#{search}%").pluck(:director)
      end
    end
  end

  #   if params[:d] != nil && params[:d].length > 0
  #     puts "in director"
  #     search = params[:d].downcase
  #     @director_results = Movie.where('LOWER(director) LIKE ?', "%#{search}%").pluck(:director)
  #   end
  #   if params[:m] != nil && params[:m].length > 0
  #     puts "in movie"
  #     search = params[:m].downcase
  #     @movie_results = Movie.where('LOWER(title) LIKE ?', "%#{search}%")
  #   end
  # end
end

