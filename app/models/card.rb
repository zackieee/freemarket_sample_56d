class Card < ApplicationRecord
  belongs_to :user

  attr_accessor :card
  attr_accessor :err

  include PayjpCustomer
  # include PayjpCharge

  def self.create(user,payjp_token)
    
    customer, err = PayjpCustomer::customer_create(payjp_token)
    
    if err.nil?
      card = Card.create(
        user_id:     user.id,
        customer_id: customer.id,
        card_id:     customer.default_card,
      )
      if card.save?
        return card, err
      else
        customer, err = PayjpCustomer::customer_destroy(card)
        return card, err
      end
    end
  end

  def self.show(card)
    result = PayjpCustomer::customer_show(card)
    if result.kind_of?(Payjp::Card)
      @card = result
      err  = nil
    else
      @card = nil
      err  = result.json_body
    end

    return @card, err
    
  end

  def self.destroy(card)
    ActiveRecord::Base.transaction do
      card.delete!
      PayjpCustomer::customer_destroy(card)
    end

  end

end