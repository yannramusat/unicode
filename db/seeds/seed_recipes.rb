require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipes.csv'))
csv = CSV.parse(csv_text, headers: true, row_sep: "\r")

known_ingredients = {}
recipes = []
csv.each do |row|
  recipe = Recipe.new
  recipe.title = row[0]
  recipe.instructions = row[1]
  recipe.category = row[59]

  ingredient_names_col = [4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58]
  ingredient_names_col.each do |i|
    if row[i]
      known_ingredients[row[i]] ||= Ingredient.create(name: row[i])
      recipe.ingredients << known_ingredients[row[i]]
    end
  end

  recipes << recipe
end

# using gem "activerecord-import" to improve efficiency of bulk imports
stats = Recipe.import recipes

stats.failed_instances.each do |failed_instance|
  if failed_instance.title
    puts "[info] The recipe `#{failed_instance.title}` has been filtered out due to missing instructions."
  elsif
    puts "[info] A recipe has been filtered out due to a missing title."
  end
end

puts "There are #{Ingredient.count} distinct ingredients within these recipes."
puts "Seeded #{Recipe.count} recipes."