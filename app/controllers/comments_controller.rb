class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to item_path(@comment.item_id)}
        format.json
      end
    else
      redirect_to item_path(@comment.item_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end