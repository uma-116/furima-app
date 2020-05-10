class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
     #とりあえずリダイレクト先をトップページに設定
    redirect_to root_path
  end

  private
  def item_params
    # :user_id, :category_idの２つはテスト用なので後で削除
    params.require(:item).permit(:user_id, :category_id, :name, :detail, :condition, :postage, :ship_from, :ship_date, :price)
  end


end
