require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  context "sign_up" do
    it "新規登録" do
      post user_registration_path, params: { name: user.name,
                                             email: user.email,
                                             password: user.password,
                                             password_confirmation: user.password }
      expect(response).to redirect_to user
    end
  end

  context "sign_in" do
    it "ログイン" do
      post user_session_path, params: { email: user.email, password: user.password }
      expect(response).to redirect_to user
    end
  end

  context "#show" do
    it "userページにアクセス" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  context "#edit" do
    it "編集ページにアクセス" do
      get edit_user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
