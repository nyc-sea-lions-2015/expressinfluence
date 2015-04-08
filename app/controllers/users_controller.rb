class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def new

  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find_by(id: params[:id])
    @contacts = Contact.where(user_id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
