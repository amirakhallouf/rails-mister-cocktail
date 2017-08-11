# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# psuedo code:
# 1st do this some times (3 or 4)

# 10.times do

#   ingredient = Ingredient.new( name:Faker::Food.ingredient)
#   ingredient.save
# end

# 2nd this only one (we just want 10 cocktails)
10.times do
  cocktail = Cocktail.new(name: Faker::Book.title)
  cocktail.save
end

# (we want more doses than cocktails! but we need cocktails to make doses... so....)
# 3rd. first create the doses and connect them to the cocktails, then do another round and add one more dose to each cocktail!

Cocktail.all.each do |cocktail|
   cocktail.doses.create(description: Faker::Food.measurement, ingredient: Ingredient.all.sample )
  # Dose.new(description:Faker::Food.measurement, ingredient: Ingredient.all.sample, cocktail: cocktail).save
end

10.times do
  ingredient = Ingredient.new(name:Faker::Food.ingredient)
  ingredient.save
end
