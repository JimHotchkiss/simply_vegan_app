module RecipesHelper

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_comments
    find_recipe.comments.most_recent(@recipe.comments.count)
  end

  def recipe_user
    @recipe.user_id = current_user.id
    @recipe.save
  end

  def find_recipe_ingredients
    @recipe.recipe_ingredients.each do |recipe_ingredient|
      recipe_ingredient
    end    
  end


end
