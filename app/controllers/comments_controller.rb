class CommentsController < ApplicationController

  before_action :user_signed_in?, only: [ :create, :edit]

  def create
    p params
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(params[:comment].permit(:body))
    @user.comments << @comment
    @comment.save
    redirect_to movie_path(@movie)

  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.find(params[:id])

    if @comment.update(params[:comment].permit(:body))
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end
end
