class CaloriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @calorie = current_user.build_calorie
  end

  def create
    @calorie = current_user.build_calorie(calorie_params)
    if @calorie.save
      flash[:success] = "目標カロリーを登録しました"
      redirect_to current_user
    else
      render "calories/new"
    end
  end

  def edit
    @calorie = current_user.calorie
  end

  def update
    @calorie = current_user.calorie
    if @calorie.update(calorie_params)
      flash[:success] = "目標カロリーを更新しました"
      redirect_to current_user
    else
      render "calories/edit"
    end
  end

  private

  def calorie_params
    params.require(:calorie).permit(:protein, :fat, :carbohydrate)
  end
end
