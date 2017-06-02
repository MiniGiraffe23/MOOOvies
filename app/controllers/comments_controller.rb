class CommentsController < ApplicationController

  # before_action :user_signed_in?, only: [ :create]

  def create
    @user = current_user
    @movie = Movie.find(params[:id])
    @comment = @movie.comments.new(params[:comment].permit(:body))
    @user.comments << @comment
    @comment.save
  end
end
