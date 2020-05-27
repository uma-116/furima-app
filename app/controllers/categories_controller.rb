class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.subtree_ids)
  end
  
end