require 'rails_helper'

RSpec.feature "Users", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  scenario "過去の登録ページにアクセス" ,focus: true do

    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link "食材登録"

    fill_in "食材名", with: "昨日の登録", match: :first
    fill_in "タンパク質", with: 20, match: :first
    fill_in "脂質", with: 20, match: :first
    fill_in "炭水化物", with: 20, match: :first
    fill_in "日付", with: Time.zone.yesterday, match: :first
    fill_in "量", with: 100, match: :first
    click_button "登録"

    click_link "過去の登録"

    fill_in "日付", with: Time.zone.yesterday
    click_button "表示"
    
    expect(page).to have_content "昨日の登録"
  end
end
