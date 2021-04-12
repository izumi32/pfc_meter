require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "#create" do

    let(:user) { FactoryBot.create(:user) }

    it "新規登録時user/showページにリダイレクト" do
      post user_registration_path, params: { name: user.name,
                                             email: user.email,
                                             password: user.password,
                                             password_confirmation: user.password }
      expect(response).to redirect_to user
    end

  end
end
