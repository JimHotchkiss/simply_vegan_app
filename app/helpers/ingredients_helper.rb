module IngredientsHelper

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
