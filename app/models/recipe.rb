class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :instructions, presence: true
  has_and_belongs_to_many :ingredients

  def self.best(ingredients)
    best_recipes = Ingredient.where(id: ingredients)
                             .joins(:recipes)
                             .group(:recipe_id)
                             .select('*, count(ingredient_id) as ingredient_count')
                             .order(ingredient_count: :desc)
  end
end
