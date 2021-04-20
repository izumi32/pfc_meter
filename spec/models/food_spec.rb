require 'rails_helper'

RSpec.describe Food, type: :model do

  let(:food) { FactoryBot.create(:food) }

  it "food_nameが空の場合エラーを返す" do
    food.food_name = ""
    expect(food).to_not be_valid
  end

  it "proteinが空の場合エラーを返す" do
    food.protein = ""
    expect(food).to_not be_valid
  end

  it "fatが空の場合エラーを返す" do
    food.fat = ""
    expect(food).to_not be_valid
  end

  it "carbohydrateが空の場合エラーを返す" do
    food.carbohydrate = ""
    expect(food).to_not be_valid
  end

  it "dateが空の場合エラーを返す" do
    food.date = ""
    expect(food).to_not be_valid
  end

  it "amountが空の場合エラーを返す" do
    food.amount = ""
    expect(food).to_not be_valid
  end
end
