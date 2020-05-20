class Items::SearchesController < ApplicationController
  def index
    @items = Tweet.search(params[:keyword])
  end
end
