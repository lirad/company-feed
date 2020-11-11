require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before :each do
    @user_a = User.create(FullName: 'Diego Lira', Username: 'lirad', email: 'd@gd.com', password: '123123')
    @user_a.opinions.build(Text: 'Lorem ipsum')
    @opinion = Opinion.first
  end

  context 'Opinions action' do
    it 'user can post an opinion' do
      expect(Opinion.first).to eq(@opinion)
    end
  end
end
