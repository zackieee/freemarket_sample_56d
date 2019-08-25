class RatingsController < ApplicationController
  before_action :notice_count,:todo_count, only: [:index]

  def index
    @ratings = Rating.where(rated_user: current_user.id).order("created_at DESC")
  end

  def index_api

    if params[:rating].to_i.eql?(0)
      @ratings = Rating.where("(rated_user_id = ?)",current_user.id).order("created_at DESC")
    else
      @ratings = Rating.where("(rated_user_id = ?) && (rate = ?)",current_user.id,params[:rating]).order("created_at DESC")
    end

    respond_to do | format |
      format.json {@ratings}
    end
  end

end
