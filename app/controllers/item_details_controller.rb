class ItemDetailsController < ApplicationController
  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @item_detail = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, user_ids: [])
  end
end