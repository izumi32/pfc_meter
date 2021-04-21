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

  # describe "#update" do
  #
  #   context "ログインユーザー" do
  #     it "登録した食材を編集" do
  #       login_as user
  #     end
  #   end
  #
  #   context "ゲストユーザー" do
  #
  #   end
  # end

end
