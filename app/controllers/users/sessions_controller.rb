class Users::SessionsController < Devise::SessionsController
  def sign_out_confirm
    redirect_to root_path
  end
end