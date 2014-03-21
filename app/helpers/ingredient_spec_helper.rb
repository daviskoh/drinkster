module IngredientSpecHelper
  def input_new_ingredient
    within 'form.add-ingredient' do 
      fill_in :ingredientName, with: 'whiskey'

      click_button 'Add Ingredient'
    end
  end
end