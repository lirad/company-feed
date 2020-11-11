class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:Username, :FullName, :Photo, :CoverImage, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:FullName, :Username, :email, :Photo, :CoverImage, :password,
                                 :password_confirmation, :current_password)
  end
end
