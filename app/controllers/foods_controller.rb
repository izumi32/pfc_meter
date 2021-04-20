class FoodsController < ApplicationController

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:success] = "食材を登録しました"
      redirect_to current_user
    else
      render 'foods/new'
    end
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :protein, :fat, :carbohydrate, :date, :amount)
  end
end
