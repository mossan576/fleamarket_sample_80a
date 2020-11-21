class TransactionsController < ApplicationController
  
  def buy
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_credit_card_information = customer.cards.retrieve(credit_card.card_id)
    end
  end

  def done
  end

end