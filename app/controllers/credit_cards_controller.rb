class CreditCardsController < ApplicationController
   ###user機能実装後に”user_id: 1”を”user_id: current_user.id"に変更

  def new
    card = CreditCard.where(user_id: 1) 
    # redirect_to "/credit_cards/show"  if card.exists?
    # 上記はuer機能実装後に設定予定
  end

  def pay #payjpとCardのデータベース作成
    Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]

    #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: 1}
      ) 
      @card = CreditCard.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/credit_cards/show"
      else
        redirect_to pay_cards_path
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出す
    card = CreditCard.find_by(user_id: 1)
    if card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
