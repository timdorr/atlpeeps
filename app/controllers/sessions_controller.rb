class SessionsController < ApplicationController
  def create
    @identity = Identity.first_or_create_with_omniauth(request.env['omniauth.auth'])

    if signed_in?
      if @identity.user == current_user
        redirect_to accounts_path, notice: "You're already linked that account."
      else
        @identity.user = current_user
        @identity.save!
        redirect_to accounts_path, flash: {success: "Connected to your #{@identity.provider_title} account."}
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_path
      else
        self.current_user = User.create(name: @identity.name)
        @identity.user = current_user
        @identity.save!

        redirect_to accounts_path, flash: {success: "You've successfully set up an ATLpeeps account. Now fill out your profile."}
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end
end