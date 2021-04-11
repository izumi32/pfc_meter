require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

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
