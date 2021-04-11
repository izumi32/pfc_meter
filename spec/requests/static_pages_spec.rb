require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "#home" do

    it "homeにアクセス" do
      get root_url
      expect(response).to have_http_status(200)
    end
  end
end
