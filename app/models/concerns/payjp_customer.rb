require 'payjp'

module PayjpCustomer

  Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]

  attr_accessor :customer
  attr_accessor :err

  # 顧客を作成する
  def self.customer_create(payjp_token)
    begin
      @customer = Payjp::Customer.create(
        description: 'freemaket_sample_56d',
        card: payjp_token,
      )
      @customer , @err
    rescue Payjp::PayjpError => e
      @customer , e.json_body
    end
  end

  def self.customer_show(card)
    binding.pry
    begin
      customer = Payjp::Customer.retrieve(
                  card.customer_id
                )
      customer.cards.retrieve(card.card_id)
    rescue Payjp::PayjpError => e
      e
    end
  end

  def self.customer_destroy(card)
    begin
      @customer = Payjp::Customer.retrieve(
                  card.customer_id
                )
      @customer.delete
      @customer, @err
    rescue Payjp::PayjpError => e
      return @customer, e.json_body
    end
  end

end