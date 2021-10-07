require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  context "ログイン時" do

    before do
      login_as user
    end

    describe "#show" do
      it "showビューにアクセス" do
        get user_path(user)
        expect(response).to have_http_status(200)
      end
    end

    describe "#edit" do
      it "editビューにアクセス" do
        get edit_user_path(user)
        expect(response).to have_http_status(200)
      end
    end

    describe "#update" do
      it "userを更新" do
        patch user_path(user), params: { user: { email: "new_email@sample.com" } }
        user.reload
        expect(user.email).to eq "new_email@sample.com"
      end

      it "userを更新後user/showページにリダイレクト" do
        patch user_path(user), params: { user: { name: "edit user" } }
        user.reload
        expect(response).to redirect_to user_path(user)
      end
    end

    describe "#history" do
      it "historyビューにアクセス" do
        get history_user_path(user)
        expect(response).to have_http_status(200)
      end
    end

  end

  context "非ログイン時" do

    describe "#show" do
      it "showビューにアクセス" do
        get user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "#edit" do
      it "editビューにアクセス" do
        get edit_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "#update" do
      it "userを更新" do
        patch user_path(user), params: { user: { name: "edit user" } }
        user.reload
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "#history" do
      it "historyビューにアクセス" do
        get history_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


end
