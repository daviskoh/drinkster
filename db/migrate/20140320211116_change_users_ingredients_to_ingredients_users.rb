class ChangeUsersIngredientsToIngredientsUsers < ActiveRecord::Migration
  def change
    drop_table :users_ingredients

    create_table :ingredients_users do |t|
      t.belongs_to :ingredient, null: false
      t.belongs_to :user, null: false
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE ingredients_users
          ADD CONSTRAINT fk_ingredients
          FOREIGN KEY (ingredient_id)
          REFERENCES ingredients(id),
          ADD CONSTRAINT fk_users
          FOREIGN KEY (user_id)
          REFERENCES users(id)
        SQL
      end
    end
  end
end
