class CaloriesController < ApplicationController

  def new
    @calorie = current_user.build_calorie
  end

  def create
    @calorie = current_user.build_calorie(calorie_params)
    if @calorie.save
      flash[:success] = "目安カロリーを登録しました"
      redirect_to current_user
    else
      render "calories/new"
    end
  end

  private

  def calorie_params
    params.require(:calorie).permit(:protein, :fat, :carbohydrate)
  end
end
