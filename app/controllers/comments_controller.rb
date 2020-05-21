class CommentsController < ApplicationController
  # コメント機能実装時コメントアウト外す
  # def create
  #   @comment = Comment.create(comment_parmas)
  #   redirect_to "/items/#{comment.item.id}"
  # end

  # private
  # def comment_params
  #   params.require(:comment).permit(:text).merge(user_id: current_user.id)
  # end
end