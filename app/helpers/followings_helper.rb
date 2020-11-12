module FollowingsHelper
  def a_follower?(user)
    current_user.followings.where(id: user).exists?
  end
end
