class CommentsController < ApplicationController

  def new
    @comment = Comment.new(recipe_id: params[:recipe_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to recipe_path(@comment.recipe_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :recipe_id)
  end
end
