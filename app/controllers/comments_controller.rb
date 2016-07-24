class CommentsController < ApplicationController
  def index
    @micropost = Micropost.find_by(:id params[:micropost_id])
    @comments = @micropost.comments
  end

  def new
    @micropost = Micropost.find_by(:id params[:micropost_id])
    @comment = @micropost.comments.build()
  end

  def create
    @micropost = Micropost.find_by(:id params[:micropost_id])
    @comment = @micropost.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to micropost_comment_url(@micropost, @comment)
    else
      render 'new'
    end
  end

  def show
    @micropost = Micropost.find(params[:micropost_id])
    @comments = @micropost.comments.find(params[:id])
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end
end
