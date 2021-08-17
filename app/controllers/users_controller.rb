class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "ようこそ、#{@user.namename}さん"
    else
      flash.new[:danger] = "ユーザーの作成に失敗しました"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
