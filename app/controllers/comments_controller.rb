class CommentsController < ApplicationController

  def create
    @comment = Comment.new(
      text: params[:comment][:text],
      user_id: current_user.id,
      product_id: params[:product_id]
      )
    if @comment.save
      if @comment.product.trade.seller.id == current_user.id
        sender_id = current_user.id
        receiver_id = @comment.product.trade.buyer.id
      else
        sender_id = current_user.id
        receiver_id = @comment.product.trade.seller.id
      end
      notice = Notification.create(
        sender_id:    sender_id,
        receiver_id:  receiver_id,
        trade_id:     @comment.product.trade.id,
        action:       4,
        title:        "#{current_user.nickname}さんが「#{@comment.product.name}」にコメントしました"
      )
      redirect_to product_trade_path(product_id: @comment.product.id,id: @comment.product.trade.id)
      return
    else
      render product_trade_path(product_id: @comment.product.id,id: @comment.product.trade.id)
      return
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
