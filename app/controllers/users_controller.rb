class UsersController < ApplicationController
  def show
  end

  # これを呼ぶと見たいユーザのプロフィールページが参照できる
  def show_profile
    @user = User.find(params[:id])
  end
end
