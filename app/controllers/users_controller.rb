class UsersController < ApplicationController
  def index
    @users = User.published.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:user][:id])
    if @user.update(user_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :website, :bio)
  end
end