require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "patrick1",
    email: "ptoc@gmail.com", 
    password: "p123456", 
    password_confirmation: "p123456" )
  end

  describe 'Validations' do

    it "it has valid name" do
      @user.name = "Tim"
      expect(@user.name).not_to be_empty
    end

    it "is a valid user" do
      @user.save!
      expect(@user).to be_valid
    end

    it "has a valid password" do
      @user.password = "222222"
      expect(@user.password).not_to eq(@user.password_confirmation)
    end

    describe '.authenticate_with_credentials' do
      user = User.create(name: "Tim", email: "p@test.com", password: "hhhhhh", password_confirmation: "hhhhhh")

      it 'has uppercase and spaces' do 
        logged_user = User.authenticate_with_credentials('p@test.com   ', 'hhhhhh')
        expect(logged_user.email).to eq(user.email)
      end

      it 'email doesnt match' do
        logged_user = User.authenticate_with_credentials('p2@test.com', 'hhhhhh')
        expect(logged_user).to eq(nil)
      end

      it 'password doesnt match' do
        logged_user = User.authenticate_with_credentials('p@test.com', 'hhhhhhhh3')
        expect(logged_user).to eq(nil)
      end
    end
  end

end
