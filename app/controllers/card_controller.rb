class CardController < ApplicationController

  def show
    #card情報がない場合、新規作成画面にリダイレクト
    redirect_to :new if current_user.card.nil? and return
    
    #クレジットカード情報が登録されていた場合のみ情報取得
    @card,@err = Card.show(current_user.card)
    
  end

  def new
  end

  def create
  end

  def destroy
  end

end
