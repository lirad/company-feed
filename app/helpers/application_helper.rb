module ApplicationHelper
  def user_cover
    if current_user.CoverImage.attached?
      image_tag @current_user.CoverImage
    else
      image_tag 'default-bg.png'
    end
  end

  def user_avatar
    if current_user.Photo.attached?
      image_tag current_user.Photo
    else
      image_tag 'avatar-1.png'
    end
  end

  def avatar?(user)
    if user.Photo.attached?
      image_tag user.Photo
    else
      image_tag 'avatar-1.png'
    end
  end

  def cover?(user)
    if user.CoverImage.attached?
      image_tag user.CoverImage
    else
      image_tag 'default-bg.png'
    end
  end

  def self?(user)
    current_user == user
  end

  def who_to_follow
    users_followed = []
    current_user.following_relationships.each { |n| users_followed << n.FollowedId }
    users_followed << current_user.id
    User.where.not(id: users_followed).limit(3).order('created_at DESC')
  end

  def followers_count
    current_user.followers.count
  end

  def following_count
    current_user.followings.count
  end
end
