class AddPartsToDrinksIngredients < ActiveRecord::Migration
  def change
    add_column :drinks_ingredients, :parts, :integer
  end
end
