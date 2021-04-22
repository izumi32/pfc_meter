require 'rails_helper'

RSpec.describe "Foods", type: :request do

  let(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.create(:food, user: user) }

  describe "#edit" do

    context "ログインユーザー" do

      it "editビューにアクセス" do
        login_as user
        get edit_food_path(food)
        expect(response).to have_http_status(200)
      end
    end

    context "ゲストユーザー" do

      it "editビューにアクセス" do
        get edit_food_path(food)
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "#update" do

    context "ログインユーザー" do

      it "食材を更新" do
        login_as user
        patch food_path(food), params: { food: { food_name: "ゆで卵" } }
        food.reload
        expect(food.food_name).to eq "ゆで卵"
      end
    end

    context "ゲストユーザー" do

      it "食材を更新できずログイン画面にリダイレクト" do
        patch food_path(food), params: { food: { food_name: "ゆで卵" } }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "#destroy" do

    context "ログインユーザー" do

      it "食材を削除" do
        login_as user
        food.save
        expect {
          delete food_path(food)
        }.to change(user.foods, :count).by(-1)
      end
    end

    context "ゲストユーザー" do
      it "食材削除に失敗" do
        delete food_path(food)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
