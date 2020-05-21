class PurchasesController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_item, :set_address

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
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

  def pay
    Payjp.api_key = Rails.application.credentials[:PAYJP_ACCESS_KEY]
    Payjp::Charge.create(
      :amount => @item.price, #価格を取得
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    @item.update!(buyer_id: current_user.id)
    redirect_to root_path 
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) 
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_address
    @address = Address.where(user_id: current_user.id).first
  end

end
