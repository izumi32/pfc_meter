class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    p user
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "アカウントを有効化しました"
      redirect_to user
    else
      flash[:danger = "有効化できません"]
      redirect_to root_url
    end
  end
end
