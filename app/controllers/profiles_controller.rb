class ProfilesController < OpinionsController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @id = params[:id]
    @tweets = @user.opinions.count
    @followers_count = @user.followers.count
    @followers = @user.followers.where.not(id: current_user.id).includes([:Photo_attachment => [:blob]] )
    @following = @user.followings.count
    @opinions = @user.opinions.includes(:user => [:Photo_attachment => [:blob]] )
  end
end
