class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @food = Form::FoodCollection.new
  end

  def create
    if params[:food].nil?
      @food = Form::FoodCollection.new(food_collection_params)
    else
      @food = current_user.foods.build(food_params)
    end

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
      flash[:success] = "食材を更新しました"
      redirect_to user_path(@user)
    else
      render 'foods/edit'
    end
  end

  def destroy
    food = Food.find(params[:id])
    @user = User.find(food.user_id)
    food.destroy
    flash[:danger] = "食材を削除しました"
    redirect_to @user
  end

  def search
    food_name = params[:form_food_collection][:food_name]

    uri = URI.parse URI.encode("https://apex.oracle.com/pls/apex/izumi/food/#{food_name}")
    @query = uri.query

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.start do |http|
      http.get(uri.request_uri)
    end

    begin
      @results = JSON.parse(response.body)

      respond_to do |format|
        format.html { render :show }
        format.json
      end

    rescue => e
      @message = "e.message"
    end
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
