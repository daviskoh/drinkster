require 'spec_helper'

describe 'add ingredient', js: true do 
  before :all do 
    FactoryGirl.create(:user)
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
      fill_in :name, with: 'whiskey'

      click_button 'Add Ingredient'
    end

    expect(user.ingredients.first.name).to eq 'whiskey'
  end
end