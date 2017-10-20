class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient, optional: true


  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.each do |index, value|
      if !value.blank?
        ingredient = Ingredient.find_or_create_by(name: value)
        self.ingredient = ingredient
      end
    end
  end


end
