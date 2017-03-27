class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  #POST to users/:user_id/profile
  def create
    #Ensure we have the user that is filling out the form/signed in
    @user = User.find(params[:user_id])
    #Create profile that is linked to this specific user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Your profile has been successfully updated"
      redirect_to root_path
    else
      #if it does not save, we will render the form again
      render action: :new
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end

end
