require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameが空の時エラーを返す" do
    user = User.new(name: "", email: "test@example.com")
    expect(user).to_not be_valid
  end

  it "emailが空の時エラーを返す" do
    user = User.new(name: "test user", email: "")
    expect(user).to_not be_valid
  end
end
