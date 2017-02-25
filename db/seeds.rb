require "open-uri"
require "json"
require "faker"


#populate ingredients === done

info = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
info["drinks"].each do |ingredient|
  name_ingredient = ingredient["strIngredient1"]
  Ingredient.create(name: name_ingredient)
end


Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
# get a random number of ingredients and assing each with a dose to a cocktail 50 times === done

50.times do |i|
  cocktail_name = Faker::Name.first_name
  cocktail = Cocktail.new(name: cocktail_name)
  cocktail.save
  rand_number = rand(3) + 2
  rand_number.times do |i|
    offset = rand(Ingredient.count)
    rand_record = Ingredient.offset(offset).first

    dose_description = Faker::Lorem.paragraph
    dose = Dose.new(description: dose_description)
    dose.ingredient = rand_record
    dose.cocktail = cocktail
    dose.save
  end
end
