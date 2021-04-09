require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "#home" do
    it "トップページにgetリクエスト" do
      get :home
      expect(response).to redirect_to root_url
    end
  end
end
