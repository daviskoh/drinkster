class DropDrinksIngredients < ActiveRecord::Migration
  def change
    drop_table :drinks_ingredients
  end
end
