require 'rails_helper'

RSpec.describe StaticPages, type: :controller do

  describe "#home" do

    it "正常なレスポンス" do
      get :home
      expect(response).to be_success
    end

    it "トップページにリダイレクト" do
      get :home
      expect(response).to redirect_to root_url
    end
  end
end
