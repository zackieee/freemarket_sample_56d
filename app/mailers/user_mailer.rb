class UserMailer < ApplicationMailer

  #ユーザ登録完了通知
  def registration_confirmation(user)
    @user = user
    mail  to: @user.email,
          subject: '【freemaket.sample.d56】会員登録完了'
  end

end