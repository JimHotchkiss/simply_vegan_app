class IngredientsController < ApplicationController
  include IngredientsHelper

  def show
    @ingredient = find_ingredient
  end
end
