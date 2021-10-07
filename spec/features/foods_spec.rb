require 'rails_helper'

RSpec.feature "Foods", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end

  scenario "新規の食材を登録" do

    expect {
      click_link "食材登録"
      fill_in "食材名", with: "サンプル", match: :first
      fill_in "タンパク質", with: 20, match: :first
      fill_in "脂質", with: 20, match: :first
      fill_in "炭水化物", with: 20, match: :first
      fill_in "日付", with: Time.zone.now, match: :first
      fill_in "量", with: 100, match: :first

      click_button "登録"
    }.to change(user.foods, :count).by(1)
  end

  scenario "今日食べたものを表示" do

    click_link "食材登録"
    fill_in "食材名", with: "今日の登録", match: :first
    fill_in "タンパク質", with: 20, match: :first
    fill_in "脂質", with: 20, match: :first
    fill_in "炭水化物", with: 20, match: :first
    fill_in "日付", with: Time.zone.now, match: :first
    fill_in "量", with: 100, match: :first
    click_button "登録"

    click_link "食材登録"
    fill_in "食材名", with: "昨日の登録", match: :first
    fill_in "タンパク質", with: 20, match: :first
    fill_in "脂質", with: 20, match: :first
    fill_in "炭水化物", with: 20, match: :first
    fill_in "日付", with: Time.zone.yesterday, match: :first
    fill_in "量", with: 100, match: :first
    click_button "登録"

    expect(page).to have_content "今日の登録"
    expect(page).to_not have_content "昨日の登録"
  end

  scenario "食材を更新" do

    click_link "食材登録"
    fill_in "食材名", with: "更新前", match: :first
    fill_in "タンパク質", with: 20, match: :first
    fill_in "脂質", with: 20, match: :first
    fill_in "炭水化物", with: 20, match: :first
    fill_in "日付", with: Time.zone.now, match: :first
    fill_in "量", with: 100, match: :first
    click_button "登録"

    click_link "編集"
    fill_in "食材名", with: "更新後"
    click_button "更新"

    expect(page).to have_content "更新後"

  end

  scenario "食材を削除" do

    click_link "食材登録"
    fill_in "食材名", with: "削除前", match: :first
    fill_in "タンパク質", with: 20, match: :first
    fill_in "脂質", with: 20, match: :first
    fill_in "炭水化物", with: 20, match: :first
    fill_in "日付", with: Time.zone.now, match: :first
    fill_in "量", with: 100, match: :first
    click_button "登録"

    click_link "削除"

    expect(page).to_not have_content "削除前"
  end

  scenario "食材を検索" do
    click_link "食材登録"

    fill_in "form_food_collection_food_name", with: "卵"
    click_button "検索"

    click_button "登録", match: :first

    expect(page).to have_content "あひる卵　ピータン"
  end

end
