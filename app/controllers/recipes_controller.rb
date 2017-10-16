class RecipesController < ApplicationController
  include RecipesHelper

  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:message] = "Thanks for contributing a recipe"
      redirect_to recipe_path(@recipe)
    else
      # validation
      render :new
    end
  end

  def show
    find_recipe
    @recipe_comments = find_recipe.comments
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[], ingredients_attributes: [:name])
  end


end
