class CommentsController < ApplicationController

  def new
    @comment = Comment.new(recipe_id: params[:recipe_id])
  end

  def create
  end
end
