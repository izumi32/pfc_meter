require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  # describe "name" do
  #   it "nameが空の時エラーを返す" do
  #     @user.name = ""
  #     expect(@user).to_not be_valid
  #   end
  # end

  describe "email" do
    it "emailが空の時エラーを返す" do
      @user.email = ""
      expect(@user).to_not be_valid
    end

    it "emailが無効の時エラーを返す" do
      invalid_address = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_address.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end

    it "emailが重複する時エラーを返す" do
      duplicate_user = @user.dup
      expect(duplicate_user).to_not be_valid
    end
  end

  describe "password" do
    it "passwordが空の時エラーを返す" do
      @user.password = ""
      expect(@user).to_not be_valid
    end

    it "password_confirmationが空の時エラーを返す" do
      @user.password_confirmation = ""
      expect(@user).to_not be_valid
    end
  end
end
