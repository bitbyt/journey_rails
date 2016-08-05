class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @post
    else
      flash.now[:danger] = "error"
      redirect_to @post
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || authenticated_root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :mood)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
