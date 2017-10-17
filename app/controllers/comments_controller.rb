class CommentsController < ApplicationController

  def new
    @comment = Comment.new(recipe_id: params[:recipe_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:message] = "Thanks for your comment"
      redirect_to recipe_path(@comment.recipe_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
     redirect_to recipe_path(@comment.recipe_id)
   else
     render :new
   end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to recipe_path(@comment.recipe_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :recipe_id)
  end
end
