class RecipesController < ApplicationController
  # GET /recipes
  def index
    @best_recipes = Recipe.best(params[:ingredients])
  end
end
