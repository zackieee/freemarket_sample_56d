class RatingsController < ApplicationController
  before_action :notice_count,:todo_count, only: [:index]

  def index
    binding.pry
    @ratings = Rating.my_ratings(current_user.id).recent
  end

  def index_api
    if params[:rating].eql?('all')
      @ratings = Rating.my_ratings(current_user.id).recent
    else
      @ratings = Rating.my_ratings(current_user.id).rating_type(params[:rating]).recent
    end

    respond_to do | format |
      format.json {@ratings}
    end
  end

end
