class UsersController < ApplicationController

  def index
    @users = User.all()
    @posts = Post.where.not(user_id: current_user.id).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @post = current_user.posts.build if user_signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) if user_signed_in?
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
