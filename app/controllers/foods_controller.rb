class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Form::FoodCollection.new
  end

  def create
    @food = Form::FoodCollection.new(food_collection_params)
    if @food.save
      flash[:success] = "食材を登録しました"
      redirect_to current_user
    else
      render 'foods/new'
    end
  end

  def edit

  end

  private

  def food_collection_params
    params.require(:form_food_collection)
    .permit(foods_attributes: [:food_name, :protein, :fat, :carbohydrate, :date, :amount])
  end
end
