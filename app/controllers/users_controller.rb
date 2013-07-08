class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :current_user_administrator?, only: [:index, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
    @articles = @user.articles.order("updated_at DESC").where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 2, Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @profile = @user.build_profile(params[:profile])
    if @user.save
      @user.groups_users.create(group_id: 6, user_id: @user.id)
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user.destroy
    
    redirect_to users_url
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_profile
    @user.profile
  end
  
  def user_params
    params.require(:user).permit(:id, :login, :password, :password_confirmation)
  end
end
