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
    input_new_ingredient

    sleep 2

    expect(@user.ingredients.last.name).to eq 'whiskey'
  end

  it 'immediately renders added ingredient'
end