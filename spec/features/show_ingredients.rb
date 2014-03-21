require 'spec_helper'

describe 'show ingredients', js: true do 
  before :all do 
    @user = FactoryGirl.create(:user)
    @user.ingredients << FactoryGirl.create(:ingredient)
  end

  after :all do 
    Ingredient.destroy_all
    User.destroy_all
  end

  before :each do
    user_login
  end

  it 'shows current user\'s ingredients' do 
    within 'ul.ingredients' do 
      expect(page).to have_content 'Whiskey'
    end
  end
end