class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
  validates :instructions, presence: true

  before_save :make_title_downcase

  def make_title_downcase
    self.title = self.title.downcase
  end
end
