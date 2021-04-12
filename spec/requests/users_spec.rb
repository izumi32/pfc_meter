require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe "#show" do
    it "user/showページにアクセス" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "#edit" do
    it "編集ページにアクセス" do
      get edit_user_path(user)
      expect(response).to have_http_status(200)
    end
  end

end
