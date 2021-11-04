require 'rails_helper'

RSpec.feature "Calories", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end

  scenario "目安カロリー登録" do

    click_link "カロリー設定"
    fill_in "タンパク質", with: 130
    fill_in "脂質", with: 60
    fill_in "炭水化物", with: 350

    click_button "登録"

    expect(user.calorie.protein).to eq 130
    expect(user.calorie.fat).to eq 60
    expect(user.calorie.carbohydrate).to eq 350
  end

  scenario "目安カロリー更新" do
    click_link "カロリー設定"
    fill_in "タンパク質", with: 130
    fill_in "脂質", with: 60
    fill_in "炭水化物", with: 350

    click_button "登録"


    click_link "カロリー設定"
    fill_in "タンパク質", with: 200
    fill_in "脂質", with: 100
    fill_in "炭水化物", with: 500

    click_button "登録"

    expect(user.calorie.protein).to eq 200
    expect(user.calorie.fat).to eq 100
    expect(user.calorie.carbohydrate).to eq 500
  end
end
