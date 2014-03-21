require 'spec_helper'

describe 'show drinks', js: true do 
  context 'database is preseeded with makeable drinks' do 
    before :all do 
      @drink = FactoryGirl.create(:gin_tonic)
      @gin = FactoryGirl.create(:ingredient2)
      @tonic = FactoryGirl.create(:ingredient3)

      @user = FactoryGirl.create(:user)
    end

    after :all do 
      Ingredient.destroy_all
      User.destroy_all
    end

    before :each do 
      @drink.ingredients << @gin
      @drink.ingredients << @tonic

      @user.ingredients << @gin
      @user.ingredients << @tonic

      user_login
    end

    it 'shows what drinks a user can make' do 
      within 'ul.drinks' do
        expect(page).to have_content 'Gin and tonic'
      end
    end

    it 'updates makeable drinks when a new ingredient added'
  end
end