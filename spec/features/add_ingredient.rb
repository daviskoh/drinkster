require 'spec_helper'

describe 'add ingredient', js: true do 
  before :each do
    Ingredient.destroy_all
    
    User.destroy_all # accidentally preseeeded?

    let(:user) { FactoryGirl.create :user }

    user_login
  end

  after :each do 
    Ingredient.destroy_all
  end

  it 'allows a user to add an ingredient' do 
    within 'form.add-ingredient' do 
      fill_in :name, with: 'whiskey'

      click_button 'Add Ingredient'
    end

    expect(user.ingredients.first.name).to eq 'whiskey'
  end
end