require 'rails_helper'

RSpec.feature "Calories", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "目安カロリー登録" ,focus: true do

    click_link "カロリー設定"
    fill_in "タンパク質", with: 130
    fill_in "脂質", with: 60
    fill_in "炭水化物", with: 350

    click_button "登録"

    expect(user.calorie.protein).to eq 130
    expect(user.calorie.fat).to eq 60
    expect(user.calorie.carbohydrate).to eq 350
  end
end
