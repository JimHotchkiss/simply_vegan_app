class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :instructions, presence: true

  before_save :make_title_downcase

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attribute| attribute[:quantity].blank? && attribute[:ingredient_attributes][:name].blank?}

  private

  def make_title_downcase
    self.title = self.title.downcase
  end

  

end
