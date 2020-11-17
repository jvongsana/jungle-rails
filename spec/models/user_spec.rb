require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should be a valid user creation" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      expect(@user).to be_valid
    end

    it "Should not be able to register, failed password confirmation" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "abc123"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Should not be able to register, email already exists" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      @user2 = User.new
      @user2.name = "User Two"
      @user2.email = "test@test.ca"
      @user2.password = "123abc"
      @user2.password_confirmation = "123abc"
      @user2.save
      expect(@user2).not_to be_valid
    end
    
    it "Should not be able to register, password too short" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "12"
      @user.password_confirmation = "12"
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "Should be able to log in" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)) == (@user)
    end

    it "Should not be able to log in, wrong password entered" do
      @user = User.new
      @user.name = "User One"
      @user.email = "test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      expect(User.authenticate_with_credentials(@user.email, "abc123")) != (@user)
    end

    it "Should be able to log in with leading or trailing spaces in email" do
      @user = User.new
      @user.name = "User One"
      @user.email = " test@test.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)) == (@user)
    end

    it "Should be able to log in with wrong cases in email" do
      @user = User.new
      @user.name = "User One"
      @user.email = " TESt@teST.ca"
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)) == (@user)
    end
  end
end