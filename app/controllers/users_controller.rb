class UsersController < ApplicationController
  def show
    @category = Category.where(depth: 0)
  end

  # これを呼ぶと見たいユーザのプロフィールページが参照できる
  def show_profile
    @user = User.find(params[:id])
    @category = Category.where(depth: 0)
  end
end
