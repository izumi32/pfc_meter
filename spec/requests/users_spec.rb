require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  it "新規登録" do
    post user_registration_path, params: { name: user.name,
                                           email: user.email,
                                           password: user.password,
                                           password_confirmation: user.password }
    expect(response).to redirect_to user
  end

  it "ログイン" do
    post user_session_path, params: { email: user.email, password: user.password }
    expect(response).to redirect_to user
  end

  it "userページにアクセス" do
    get user_path(user)
    expect(response).to have_http_status(200)
  end

  it "編集ページにアクセス" do
    get edit_user_path(user)
    expect(response).to have_http_status(200)
  end

end
