require 'rails_helper'

RSpec.feature "Foods", type: :feature do
  scenario "食材を新規登録" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect {
      click_link "食材登録"
      fill_in "食材名", with: "サンプル"
      fill_in "タンパク質", with: 20
      fill_in "脂質", with: 20
      fill_in "炭水化物", with: 20
      fill_in "日付", with: DateTime.now

      click_button "登録"
    }.to change(user.foods, :count).by(1)
  end
end
