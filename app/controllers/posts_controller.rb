class PostsController < ApplicationController
  before_action :require_user, only: [:create, :destroy, :thread]

  def index
    @post = Post.new
    @all_posts = Post.order(created_at: :desc).all
    @title = 'Home'
  end

  def feed
    @post = Post.new
    @all_posts = Post.order(created_at: :desc).all
    @title = 'Feed'
  end

  def create
    if params[:reposted_post_id].nil?
      @post = Post.new(post_params)
      @post.user ||= current_user
      if @post.save
        redirect_to '/'
      else
        redirect_to '/', notice: 'Comment cannot be blank.'
      end
    else
      puts "****** IT IS HERE *******"
      @post = Post.find_by_id(params[:reposted_post_id])
      @post.user = current_user
      redirect_to '/'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private
  def post_params
    params.require(:post).permit(:comment)
  end
end
