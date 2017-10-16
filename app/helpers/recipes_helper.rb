module RecipesHelper

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
