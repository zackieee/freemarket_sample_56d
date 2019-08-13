class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  def failure
    redirect_to new_user_registration_path and return
  end
  
  private

  def callback_from(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end
end