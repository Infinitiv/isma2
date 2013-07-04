class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login
  
  def current_user
    User.find_by_id(session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "You mast be logged in"
      redirect_to index_path
    end
  end
  
  def current_user_writer?
    current_user.groups.where(writer: true).count > 0 unless current_user.nil?
  end
  
  def current_user_moderator?
    current_user.groups.where(moderator: true).count > 0 unless current_user.nil?
  end

  def current_user_commentator?
    current_user.groups.where(commentator: true).count > 0 unless current_user.nil?
  end

  def current_user_administrator?
    current_user.groups.where(administrator: true).count > 0 unless current_user.nil?
  end
end
