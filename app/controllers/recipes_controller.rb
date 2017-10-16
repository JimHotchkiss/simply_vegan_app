class RecipesController < ApplicationController
  include RecipesHelper

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      @recipe.user_id = current_user.id
      flash[:message] = "Thanks for contributing a recipe"
      redirect_to recipe_path(@recipe)
    else
      # validation
      render :new
    end
  end

  def show
    find_recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[], ingredients_attributes: [:name])
  end


end
