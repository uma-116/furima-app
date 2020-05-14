class CreditCardsController < ApplicationController
   ###user機能実装後に”user_id: 1”を”user_id: current_user.id"に変更

  def new
    card = CreditCard.where(user_id: 1) 
    # redirect_to credit_card_path  if card.exists?
    # 上記はuer機能実装後に設定予定
  end

  def pay #payjpとCreditCardのデータベース作成
    Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]

    #保管した顧客IDでpayjpから情報取得
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: 1} ###user機能実装後current_user.id"に変更
      ) 
      @card = CreditCard.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card) ###user機能実装後current_user.id"に変更
      if @card.save
        redirect_to "/credit_cards/show"
      else
        redirect_to pay_credit_cards_path
    end
  end
end

  def destroy #PayjpとCardデータベースを削除
    card = CreditCard.find_by(user_id: 1) ###user機能実装後current_user.id"に変更
    if card.present?
      Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to new_credit_card_path
  end


  def show #Cardのデータpayjpに送り情報を取り出す
    card = CreditCard.find_by(user_id: 1) ###user機能実装後current_user.id"に変更
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end
end
