class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_signed_in
    redirect_to root_path unless signed_in?
  end

  private

  def current_user
    @current_user ||= User.where(id: session[:user_id]).last
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end
end
