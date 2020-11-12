require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before :each do
    @user_a = User.create(FullName: 'Diego Lira', Username: 'lirad', email: 'd@gd.com', password: '123123')
    @user_a.opinions.create(Text: 'Lorem ipsum')
    @opinion = Opinion.first
  end

  context 'Opinions action' do
    it 'user can post an opinion' do
      expect(@opinion.valid?).to eq(true)
    end

    it 'user cannnot post a opinion without text' do
      @opinion_error = @user_a.opinions.create(Text: nil)
      expect(@opinion_error.valid?).not_to eq(true)
    end

    it 'user cannnot post a opinion with more than 300 chars' do
      long_string = 'a' * 400
      @opinion_two = @user_a.opinions.create(Text: long_string)
      expect(@opinion_two.valid?).not_to eq(true)
    end

    it 'user can list its own opinions' do
      expect(@user_a.opinions.length).to eq(1)
    end
  end
end
