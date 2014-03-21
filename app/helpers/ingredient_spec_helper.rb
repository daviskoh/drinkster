module IngredientSpecHelper
  def input_new_ingredient(name = 'whiskey')
    within 'form.add-ingredient' do 
      fill_in :ingredientName, with: name

      click_button 'Add Ingredient'
    end
  end
end