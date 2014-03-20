require 'spec_helper'

describe 'add ingredient', js: true do 
  let(:user) { FactoryGirl.create :user }

  before :each do
    user_login
  end

  after :each do 
    Ingredient.destroy_all # precaution
  end

  it 'allows a user to add an ingredient' do 
    within 'form.add-ingredient' do 
      fill_in :name, with: 'whiskey'

      click_button 'Add Ingredient'
    end

    expect(user.ingredients.first.name).to eq 'whiskey'
  end
end