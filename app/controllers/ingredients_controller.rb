class IngredientsController < ApplicationController
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.search(params[:pattern])
  end
end
