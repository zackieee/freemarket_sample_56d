class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    session[:sns] = callback_from :facebook
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
    else
      redirect_to users_sign_up_profile_path and return
    end
  end

  def google_oauth2
    session[:sns] = callback_from :google
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
    else
      redirect_to users_sign_up_profile_path and return
    end
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
    end
  end
end