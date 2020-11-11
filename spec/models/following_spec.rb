require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    @user_a = User.create!(FullName: 'Diego Lira', email: 'd@gd.com', password: '123123')
    @user_b = User.create!(FullName: 'Laura Lira', email: 'l@l.com', password: '123123')
    @a_follows_b = @user_a.following_relationships.create(FollowedId: @user_b.id)
  end

  context 'Following actions' do
    it 'user can follow another user' do
      expect(@user_b.followers.first).to eq(@user_a)
    end

    it 'user is following another user' do
      expect(@user_a.followings.first).to eq(@user_b)
    end

    it 'user can unfollow another user' do
      @user_a.following_relationships.find_by(FollowedId: @user_b.id).destroy
      expect(@user_b.followings.first).to eq(nil)
    end
  end
end
