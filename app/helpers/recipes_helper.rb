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

  def comments_array
    @comments = []
    recipes = Recipe.all

    recipes.each do |recipe|
        @comments.push(recipe.comments)
    end
    @comments
  end

  def all_recipes
    @all_recipes = []
    Recipe.all.each do |recipe|
      @all_recipes.push(recipe.recipe_ingredients)
    end
    @all_recipes
  end


end
