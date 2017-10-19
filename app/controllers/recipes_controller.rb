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
    #@recipe.recipe_ingredients.build(quantity: recipe_params[:recipe_ingrdient][:quantity])


    if @recipe.save
      flash[:message] = "Thanks for contributing a recipe"
      redirect_to recipe_path(@recipe)
    else
      # validation
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
    @recipe_comments = find_recipe.comments.most_recent(@recipe.comments.count)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[], ingredients_attributes: [:name], :recipe_ingredients_attributes => [:quantity, :ingredient_id])
  end


end
