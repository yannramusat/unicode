require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipes.csv'))
csv = CSV.parse(csv_text, headers: true, row_sep: "\r")

csv.each do |row|
  r = Recipe.new
  r.title = row[0]
  r.instructions = row[1]
  r.category = row[59]

  ingredient_names_col = [4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58]
  ingredient_names_col.each do |i|
    if row[i]
      ingredient = Ingredient.find_or_create_by(name: row[i])
      r.ingredients << ingredient
    end
  end

  unless r.save
    if row[0]
      puts "[info] The recipe `#{row[0]}` has been filtered out due to missing instructions."
    elsif
      puts "[info] A recipe has been filtered out due to missing title."
    end
  end
end

puts "There are #{Ingredient.count} distinct ingredients within these recipes."
puts "Seeded #{Recipe.count} recipes."