class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments

  validates :title, presence: true
  validates :instructions, presence: true

  before_save :make_title_downcase

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      if !ingredient_attribute[:name].blank?
        ingredient = Ingredient.find_or_create_by(ingredient_attribute)
        self.ingredients << ingredient
      end
    end
  end

  private

  def make_title_downcase
    self.title = self.title.downcase
  end
end
