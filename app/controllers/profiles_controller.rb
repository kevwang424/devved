class ProfilesController < ApplicationController
  before_action :authenticate_user!, :only_current_user

  def new
    @profile = Profile.new
  end

  def create
    #Ensure we have the user that is filling out the form/signed in
    @user = User.find(params[:user_id])
    #Create profile that is linked to this specific user. Use #build when we have association, it is
    #better than using #new in this case.
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Your profile has been successfully updated"
      redirect_to user_path(id: params[:user_id])
    else
      #if it does not save, we will render the form again
      render action: :new
    end
  end

  def edit
    @profile = User.find(current_user.id).profile
  end

  def update
    @profile = User.find(current_user.id).profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile was updated successfully"
      redirect_to user_path(id: params[:user_id])
    else
      render action: :edit
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :dev_level, :phone_number, :contact_email, :description)
    end

    def only_current_user
      @user = User.find(params[:user_id])
      redirect_to root_path unless @user == current_user
    end
end
