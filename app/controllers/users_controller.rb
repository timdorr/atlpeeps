class UsersController < ApplicationController
  before_filter :require_signed_in, only: [:edit, :update, :admin, :approve, :villager]

  def index
    @users = User.published
    @users = @users.villagers if request.domain.include?("atvpeeps")
    @users = @users.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    up = user_params
    if up[:categories].blank?
      up[:categories] = []
    end

    if @user.update(up)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def admin
    return redirect_to root_path unless current_user.admin?
    @users = User.all
  end

  def approve
    return redirect_to root_path unless current_user.admin?

    @user = User.find(params[:id])
    @user.update_attribute(:approved, true)

    redirect_to admin_users_path
  end

  def villager
    return redirect_to root_path unless current_user.admin?

    @user = User.find(params[:id])
    @user.update_attribute(:atv, !@user.atv)

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :website, :bio, :published, categories: [])
  end
end