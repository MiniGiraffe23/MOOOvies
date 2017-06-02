class SearchController < ApplicationController
  def show
    if params[:q] != nil && params[:q].length > 0
      search = params[:q].downcase
      @search_results = Movie.where('LOWER(title) LIKE ?', "%#{search}%")
    end
  end
end
