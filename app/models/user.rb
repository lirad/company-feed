class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_uniqueness_of :Username, case_sensitive: false
  validates_presence_of :Username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :Photo

  has_one_attached :CoverImage

  has_many :followings

  has_many :opinions, foreign_key: 'AuthorId', class_name: 'Opinion'

  has_many :followers_relationships, foreign_key: 'FollowedId', class_name: 'Following'
  has_many :followers, through: :followers_relationships, source: :follower

  has_many :following_relationships, foreign_key: 'FollowerId', class_name: 'Following'
  has_many :followings, through: :following_relationships, source: :following
end
