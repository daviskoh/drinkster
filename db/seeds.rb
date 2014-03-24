# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


[{ name: 'Blue Moon',
  ingredients: [
    {name: 'vodka', parts: 2},
    {name: 'lemon juice', parts: 1},
    {name: 'egg white', parts: 1},
    {name: 'orange zest'}
  ],
  instructions: 'Combine all liquid ingredients in a cocktail shaker with ice. Shake to blend and chill. Strain into a martini glass. Garnish with a fresh orange twist that has been zested over the cocktail.'
},
{ name: 'Martini',
  ingredients: [
    {name: 'gin', parts: 3},
    {name: 'vermouth', parts: 2},
    {name: 'lemon twist'}
  ],
  instructions: 'Shake all liquid ingredients with ice, strain into a Martini glass. Garnish.'
},
{ name: 'Vodka Martini',
  ingredients: [
    {name: 'vodka', parts: 3},
    {name: 'vermouth', parts: 2},
    {name: 'lemon twist'}
  ],
  instructions: 'Shake all liquid ingredients with ice, strain into a Martini glass. Garnish.'
},
{ name: 'Vodka Soda',
  ingredients: [
    {name: 'vodka', parts: 4},
    {name: 'soda water', parts: 1}
  ],
  instructions: 'Combine all ingredients in a highball glass.'
},
{ name: 'Gin Fizz',
  ingredients: [
    {name: 'gin', parts: 3},
    {name: 'lemon juice', parts: 1},
    {name: 'soda water', parts: 1},
    {name: 'sugar'}
  ],
  instructions: 'Combine all ingredients in a Collin\'s glass with ice.'
}].each do |drink|
  # create drink
  db_drink = unless Drink.find_by(name: drink[:name].downcase)
    Drink.create(name: drink[:name].downcase)
  else
    Drink.find_by(name: drink[:name].downcase)
  end

  drink[:ingredients].each do |ingredient|
    # create or find ingredient
    db_ing = unless Ingredient.exist?(ingredient[:name])
      Ingredient.create(name: ingredient[:name])
    else
      Ingredient.find_by(name: ingredient[:name])
    end

    # add ingredient to drink's list of ingredients
    db_drink.ingredients << db_ing
    # save
    db_drink.save

    # find drinks_ingredients relation
    db_comp = Component.find_by(drink_id: db_drink.id, ingredient_id: db_ing.id)

    # set amount / parts
    db_comp.parts = ingredient[:parts] if ingredient[:parts]
    # save
    db_comp.save
  end

  # add instructions
  db_drink.instructions = drink[:instructions]
  db_drink.save
end