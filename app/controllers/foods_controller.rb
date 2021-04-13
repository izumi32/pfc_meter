class FoodsController < ApplicationController

  def new
    @food = current_user.foods.new
  end

  def create
    @food = current_user.foods.build(food_params)
    @food.save
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :protein, :fat, :carbohydrate, :date)
  end
end
