class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def new

  end

  def create
    @user = User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
