# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'UnicodeData.txt'))
csv = CSV.parse(csv_text, headers: false, col_sep: ";")
characters = []
csv.each do |row|
  t = Character.new
  t.codepoint = row[0]
  t.charname = row[1]
  t.category = row[2]
  t.combining = row[3]
  t.bidi = row[4]
  t.decomposition = row[5]
  t.decimal = row[6]
  t.digit = row[7]
  t.numeric = row[8]
  t.mirrored = row[9]
  t.oldname = row[10]
  t.comment = row[11]
  t.uppercase = row[12]
  t.lowercase = row[13]
  t.titlecase = row[14]
  #t.save
  characters << t
end

Character.import characters

puts "There are now #{Character.count} unicode characters in the table."
