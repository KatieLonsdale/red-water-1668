# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@chef_1 = Chef.create(name: "Gordon Ramsey")
@chef_2 = Chef.create(name: "Bobby Flay")
@dish_1 = @chef_1.dishes.create(name: "spaghetti", description: "saucy and delicious")
@dish_2 = @chef_1.dishes.create(name: "lasagna", description: "layers of yum")
@dish_3 = @chef_2.dishes.create(name: "tacos", description: "fold up the fun")
@ingredient_1 = Ingredient.create(name: "marinara sauce", calories: 120)
@ingredient_2 = Ingredient.create(name: "noodles", calories: 200)
@ingredient_3 = Ingredient.create(name: "ricotta", calories: 250)
@ingredient_4 = Ingredient.create(name: "sausage", calories: 300)
@ingredient_5 = Ingredient.create(name: "carnitas", calories: 175)
@ingredient_6 = Ingredient.create(name: "salsa", calories: 20)
@spaghetti_marinara = IngredientDish.create(ingredient: @ingredient_1, dish: @dish_1)
@spaghetti_noodles = IngredientDish.create(ingredient: @ingredient_2, dish: @dish_1)
@lasagna_marinara = IngredientDish.create(ingredient: @ingredient_1, dish: @dish_2)
@lasagna_noodles = IngredientDish.create(ingredient: @ingredient_2, dish: @dish_2)
@lasagna_ricotta = IngredientDish.create(ingredient: @ingredient_3, dish: @dish_2)
@lasagna_sausage = IngredientDish.create(ingredient: @ingredient_4, dish: @dish_2)
@tacos_carnitas = IngredientDish.create(ingredient: @ingredient_5, dish: @dish_3)
@tacos_salsa = IngredientDish.create(ingredient: @ingredient_6, dish: @dish_3)