class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_category, omly: [:new, :create, :edit, :update]

  #トップページが表示できないため、コメントアウト
  # def index
  #   @items = Item.includes(:images).order('created_at DESC')
  # end

  def new
    @item = Item.new
    @item.images.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @item = Item.includes([:user, :images, :category]).find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit( :name, :detail, :category_id, :condition, :postage, :ship_from, :ship_date, :price, :brand, images_attributes: [:img]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents  = Category.where(ancestry: nil)
  end

  def set_children
    @children = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchildren
    @grandchildren = Category.where(ancestry: params[:ancestry])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
