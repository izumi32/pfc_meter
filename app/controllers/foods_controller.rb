class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

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
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @user = User.find(@food.user_id)
    if @food.update(food_params)
      flash[:success] = "食材情報を更新しました"
      redirect_to user_path(@user)
    else
      render 'foods/edit'
    end
  end

  def destroy
    food = Food.find(params[:id])
    @user = User.find(food.user_id)
    food.destroy
    redirect_to @user
  end

  def search
    food_name = params[:food_name]
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food)
    .permit(:food_name, :protein, :fat, :carbohydrate, :date, :amount)
  end

  def food_collection_params
    params.require(:form_food_collection)
    .permit(foods_attributes: [:food_name, :protein, :fat, :carbohydrate, :date, :amount])
  end
end
