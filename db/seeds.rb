# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
require 'httparty'
# require 'open-uri'

puts "cleaning database"
Cocktail.destroy_all

puts "creating cocktails...."

5.times do
  Cocktail.create(
    name: Faker::Games::SuperMario.character
  )
end


puts "cocktails created!!"



file_httparty = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredient_hash = JSON.parse(file_httparty.body)


puts "cleaning database"

Ingredient.destroy_all

puts "creating Ingredients...."

100.times do
  Ingredient.create(name: ingredient_hash["drinks"].sample["strIngredient1"])
end

puts "Ingredients created!!"


puts "cleaning database"
Dose.destroy_all

puts "creating doses...."


20.times do
  Dose.create(description: "#{rand(1..5)} parts")
end
puts "Doses created!!"


# file = URI.('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/webcarmine-s-amaretto-sidecar-1571169801.jpg')
# cocktail = Cocktail.new(name: "cocktail")
# cocktail.photo.attach(io: file, filename: 'webcarmine-s-amaretto-sidecar-1571169801.jpg', content_type: 'image/jpg')
# cocktail.save
