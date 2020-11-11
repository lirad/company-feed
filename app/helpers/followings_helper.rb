module FollowingsHelper
  def is_a_follower(user)
    current_user.followings.where(id: user).exists?
  end
end
