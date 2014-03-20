require 'spec_helper'

describe 'add ingredient', js: true do 
  before :all do 
    @user = FactoryGirl.create(:user)
  end

  after :all do 
    Ingredient.destroy_all
    User.destroy_all
  end

  before :each do
    user_login
  end

  it 'allows a user to add an ingredient' do 
    within 'form.add-ingredient' do 
      fill_in :ingredientName, with: 'whiskey'

      click_button 'Add Ingredient'
    end

    sleep 2

    expect(@user.ingredients.last.name).to eq 'whiskey'
  end

  it 'shows current user\'s ingredients'
end