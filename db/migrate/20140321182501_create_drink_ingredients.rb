class CreateDrinkIngredients < ActiveRecord::Migration
  def change
    create_table :drinks_ingredients do |t|
      t.belongs_to :drink, null: false
      t.belongs_to :ingredient, null: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE drinks_ingredients
          ADD CONSTRAINT fk_drinks
          FOREIGN KEY (drink_id)
          REFERENCES drinks(id),
          ADD CONSTRAINT fk_ingredients
          FOREIGN KEY (ingredient_id)
          REFERENCES ingredients(id)
        SQL
      end
    end
  end
end
