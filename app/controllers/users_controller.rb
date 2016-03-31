class UsersController < ApplicationController
  def new
    @user = User.new
    @title = 'Sign up'
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
  private
  	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
