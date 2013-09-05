class ProfilesController < UsersController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :current_user_owner?]
  def index
    @profiles = Profile.all
  end
  
  def show
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = @profiles.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to :back, notice: 'Profile was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @profile.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  private
  def set_profile
    @profile = @user.profile
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  
  def profile_params
    params.require(:article).permit(:id, :user_id, :first_name, :middle_name, :last_name, :degree_id, :academic_title_id, :email, :phone, :avatar)
  end
end
