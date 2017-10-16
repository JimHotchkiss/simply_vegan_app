class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[], ingredients_attributes: [:name])
  end


end
