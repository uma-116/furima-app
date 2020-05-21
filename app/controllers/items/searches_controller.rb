class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword])
    @count = @items.count
  end
end
