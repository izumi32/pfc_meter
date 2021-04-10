require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "正常にレスポンスを返す" do
      # get :show, { user_id: @user.id }
      # expect(response).to be_success
    end
  end
end
