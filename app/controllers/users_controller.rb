class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @foods = @user.foods.where(date: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def history
    @user = User.find(params[:id])
    if date = params[:date]
      @foods = @user.foods.where(date: Time.parse(date).beginning_of_day..Time.parse(date).end_of_day)
    else
      @foods = @user.foods.where(date: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def food_params
    params.require(:food).permit(:date)
  end
end
