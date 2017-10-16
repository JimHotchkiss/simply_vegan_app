class IngredientsController < ApplicationController
  include IngredientsHelper

  def show
    find_ingredient
  end
end
