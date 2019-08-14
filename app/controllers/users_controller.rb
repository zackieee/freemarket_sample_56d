class UsersController < ApplicationController
  def show
  end

  def update
      @user.update(address_params)
  end
  
  private

  def address_params
    params.require(:user).require(:address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address_number,
      :building_name,
    )
  end
end
