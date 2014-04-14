class SessionsController < ApplicationController
  before_filter :require_signed_in, only: [:remove]

  def index
  end

  def create
    @identity = Identity.first_or_create_with_omniauth(request.env['omniauth.auth'])

    if signed_in?
      if @identity.user == current_user
        redirect_to profile_path, flash: { "alert-warning" => "You're already linked that account." }
      else
        @identity.user = current_user
        @identity.save!
        redirect_to profile_path, flash: { "alert-success" => "You've connected your #{@identity.provider_title} account."}
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_path
      else
        self.current_user = User.create(name: @identity.name)
        @identity.user = current_user
        @identity.save!

        redirect_to profile_path, flash: { "alert-success" => "You've successfully set up an ATLpeeps account. Now fill out your profile."}
      end
    end
  end

  def remove
    if current_user.identities.count == 1
      return redirect_to profile_path, flash: { "alert-danger" => "You need to stay connected to at least one social account!" }
    end

    @identity = current_user.identities.where(provider: params[:provider]).first
    title = @identity.provider_title
    @identity.destroy

    redirect_to profile_path, flash: { "alert-danger" => "You've disconnected your #{title} account."}
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, flash: { "alert-warning" => "Signed out!" }
  end
end