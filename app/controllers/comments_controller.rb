class CommentsController < ApplicationController
  def create
    @user = current_user
    @movie = Movie.find(params[:id])
    @comment = @movie.comments.new(params[:comment].permit(:body))
    @user.comments << @comment
    @comment.save
  end
end
