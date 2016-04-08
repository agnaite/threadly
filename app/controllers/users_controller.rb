class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
  #                                       :following, :followers]
  def new
    @user = User.new
    @title = 'Sign up'
  end
  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @title = @user.username
  end
  def create
  	@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "Something seems to be missing or incorrect. Please try again."
      redirect_to '/signup'
    end
  end
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  private
  	def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end
