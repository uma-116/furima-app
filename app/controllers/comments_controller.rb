class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item_id), notice: 'コメントを送信しました'
    else
      redirect_to item_path(@comment.item_id), notice: 'コメントの送信に失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end