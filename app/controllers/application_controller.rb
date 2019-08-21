class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  # 利用する場合は、各コントローラのbefore_actionで指定してください
  # 未読のお知らせ数をカウントするメソッド
  def notice_count
    if user_signed_in?
      @notices = Notification.where.not(action: 5 ).where("(receiver_id = ?) AND (checked = ?)",current_user.id,0).count
    end
  end

  # TODOがある場合、未読／既読に関わらずカウントするメソッド
  def todo_count
    if user_signed_in?
      @todo = Notification.where("(receiver_id = ?) AND (action = ?) AND (todo_status = ?)",current_user.id,5,0).count
    end
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
