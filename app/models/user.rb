class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followings

  has_many :followers_relationships, foreign_key: 'FollowedId', class_name: 'Following'
  has_many :followers, through: :followers_relationships, source: :follower

  has_many :following_relationships, foreign_key: 'FollowerId', class_name: 'Following'
  has_many :followings, through: :following_relationships, source: :following
  
  def self.who_to_follow(user)
    users_not_followed = []
    user.followers_relationships.each { |n| users_not_followed << n.FollowedId }
    User.where.not(id: users_not_followed)
  end
end
