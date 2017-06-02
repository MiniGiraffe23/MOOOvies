class CommentsController < ApplicationController

  # before_action :user_signed_in?, only: [ :create]

  def create
    p params
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(params[:comment].permit(:body))
    @user.comments << @comment
    @comment.save
    redirect_to movie_path(@movie)

  end
end
