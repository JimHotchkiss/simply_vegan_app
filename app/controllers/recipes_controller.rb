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

    if @recipe.save
      recipe_user
      flash[:message] = "Thanks for contributing a recipe"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = find_recipe
  end

  def update
    @recipe = find_recipe
    @recipe.update(recipe_params)
    if @recipe.save
     redirect_to recipe_path(@recipe)
   else
     render :new
   end
  end

  def destroy
    find_recipe.destroy
    redirect_to root_path
  end

  def show
    @recipe = find_recipe
    @recipe_comments = recipe_comments

  end

  def most_comments
    comments_array
    sorted_comments = comments_array.sort_by(&:size)
    @most_comments = sorted_comments.last
    @comment_recipe = Recipe.find(@most_comments[0].recipe_id)
    redirect_to recipe_path(@comment_recipe)
  end

  def easy_recipe
    all_recipes
    sorted_recipes = all_recipes.sort_by(&:size)
    @min_ingredients = sorted_recipes.first
    @easy_recipe = Recipe.find(@min_ingredients[0].recipe_id)
    redirect_to recipe_path(@easy_recipe)

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[], recipe_ingredients_attributes: [:quantity, ingredient_attributes: [:name]])
  end

end
