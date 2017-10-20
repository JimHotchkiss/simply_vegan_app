module RecipesHelper

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_comments
    @recipe.recipe_ingredients.build.build_ingredient
  end
 
end
