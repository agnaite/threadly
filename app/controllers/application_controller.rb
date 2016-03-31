class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    # return the current user or a new "blank" user
    @current_user = User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    redirect_to '/' unless current_user
  end
end
