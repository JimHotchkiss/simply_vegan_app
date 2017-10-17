module IngredientsHelper

  def find_ingredient
    Ingredient.find(params[:id])
  end
end
