require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "#create" do

    let(:user) { FactoryBot.create(:user)}

    it "ログイン時user/showページにリダイレクト" do
      post user_session_path, params: { email: user.email, password: user.password }
      expect(response).to redirect_to user
    end

  end
end
