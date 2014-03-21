class AlterIngredientsDrinks < ActiveRecord::Migration
  def change
    change_table :ingredients_users do |t|
      t.timestamps
    end
  end
end
