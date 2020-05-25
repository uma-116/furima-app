class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @items = Item.limit(3).where(category_id: @category.id)
  end

end