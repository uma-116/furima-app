class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword]).order('created_at DESC').where("buyer_id is NULL")
    @count = @items.count
  end
end
