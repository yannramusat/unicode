class IngredientsController < ApplicationController
  # GET /ingredients
  def index
    @ingredients = Ingredient.search(params[:pattern])
  end
end
