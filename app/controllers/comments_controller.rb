class CommentsController < ApplicationController
  def index
    @micropost = Micropost.find_by(id: params[comment_params])
    @comments = @micropost.comments
  end

  def new
    @micropost = Micropost.find_by(id: params[comment_params])
    @comment = @micropost.comments.build()
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def show
    @micropost = Micropost.find(params[:micropost_id])
    @comments = @micropost.comments.find(params[:id])
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url

  end

  private
   def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end
end

