require 'rails_helper'

RSpec.feature "Foods", type: :feature do
  scenario "新規の食材を登録" do
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
      fill_in "日付", with: Time.zone.now
      fill_in "量", with: 100

      click_button "登録"
    }.to change(user.foods, :count).by(1)
  end

  scenario "今日食べたものを表示" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link "食材登録"
    fill_in "食材名", with: "今日の登録"
    fill_in "タンパク質", with: 20
    fill_in "脂質", with: 20
    fill_in "炭水化物", with: 20
    fill_in "日付", with: Time.zone.now
    fill_in "量", with: 100
    click_button "登録"

    click_link "食材登録"
    fill_in "食材名", with: "昨日の登録"
    fill_in "タンパク質", with: 20
    fill_in "脂質", with: 20
    fill_in "炭水化物", with: 20
    fill_in "日付", with: Time.zone.yesterday
    fill_in "量", with: 100
    click_button "登録"

    expect(page).to have_content "今日の登録"
    expect(page).to_not have_content "昨日の登録"
  end
end
