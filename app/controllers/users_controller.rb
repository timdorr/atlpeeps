class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(params.require(:user).permit(:image))


    render json: @user
  end
end