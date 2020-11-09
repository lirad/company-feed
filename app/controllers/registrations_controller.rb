class RegistrationsController < Devise::RegistrationsController
    private
  
    def sign_up_params
      params.require(:user).permit(:Username, :FullName, :Photo, :CoverImage, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:FullName, :Username, :email, :Photo, :CoverImage, :password, :password_confirmation, :current_password)
    end

    def after_sign_up_path_for(resource)
      redirect_to :controller => 'opinions', :action => 'index' 
    end
    
    def after_sign_in_path_for(resource)
      redirect_to :controller => 'opinions', :action => 'index' 
    end
  end
  