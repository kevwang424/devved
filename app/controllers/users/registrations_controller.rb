class Users::RegistrationsController < Devise::RegistrationsController
  #Extends default Devise gem behavior so users signing up with Pro account (plan_id 2)
  #so they save with a stripe subscription function
  #Otherwise Devise signs up user as usual. 
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end
