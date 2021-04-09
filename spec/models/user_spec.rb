require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "name" do
    it "nameが空の時エラーを返す" do
      user = User.new(name: "",
                      email: "test@example.com",
                      password: "password",
                      password_confirmation: "password")
      expect(user).to_not be_valid
    end
  end

  describe "email" do
    it "emailが空の時エラーを返す" do
      user = User.new(name: "test user",
                      email: "",
                      password: "password",
                      password_confirmation: "password")
      expect(user).to_not be_valid
    end

    it "emailが無効の時エラーを返す" do
      invalid_address = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_address.each do |invalid_address|
        user = User.new(name: "test user",
                        email: invalid_address,
                        password: "password",
                        password_confirmation: "password")
        expect(user).to_not be_valid
      end
    end

    it "emailが重複する時エラーを返す" do
      user = User.create(name: "test user",
                      email: "test@example.com",
                      password: "password",
                      password_confirmation: "password")
      duplicate_user = user.dup
      expect(duplicate_user).to_not be_valid
    end
  end

  describe "password" do
    it "passwordが空の時エラーを返す" do
      user = User.new(name: "test user",
                      email: "test@example.com",
                      password: "")
      expect(user).to_not be_valid
    end

    it "password_confirmationが空の時エラーを返す" do
      user = User.new(name: "test user",
                      email: "test@example.com",
                      password: "password",
                      password_confirmation: "")
      expect(user).to_not be_valid
    end
  end
end
