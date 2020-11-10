class ProfilesController < OpinionsController

    
    
    def show 
        @id = params[:id]
        @user = current_user
        @opinions = current_user.opinions
    end
end
