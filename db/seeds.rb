# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do 
  Ingredient.create(name: Faker::SlackEmoji.food_and_drink, quantity: Faker::Beer.ibu)
  Recipe.create(name: Faker::Commerce.product_name, user_id: Faker::Number.between(1,10))
  RecipeIngredient.create(recipe_id: Faker::Number.between(1,10), ingredient_id: Faker::Number.between(1,10))
  User.create( email: "ericloos00@gmail.com", password: "indiana10")
end


10.times do 
  RecipeCategory.create(recipe_id: Faker::Number.between(1,10), category_id: Faker::Number.between(1,10))
end

10.times do
  Category.create(name: Faker::SlackEmoji.food_and_drink)
end