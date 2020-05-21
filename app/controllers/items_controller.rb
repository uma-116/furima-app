class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  #トップページが表示できないため、コメントアウト
  # def index
  #   @items = Item.includes(:images).order('created_at DESC')
  # end

  def index
    @items = Item.limit(3).order('created_at DESC').where("buyer_id is NULL")
    @mens_items = Item.where(category_id: 196..326).limit(3).order('created_at DESC').where("buyer_id is NULL")
    @ladies_items = Item.where(category_id: 1..195).limit(3).order('created_at DESC').where("buyer_id is NULL")
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "登録が完了しました"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def show
    @item = Item.includes([:seller, :images, :category, :comments]).find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end



  def set_parents
    @parents  = Category.where(ancestry: nil)
  end

  def set_children
    @children = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchildren
    @grandchildren = Category.where('ancestry LIKE ?', "%/#{params[:child_id]}")
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_id, :price, :brand, images_attributes: [:img]).merge(seller_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
