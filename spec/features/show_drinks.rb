require 'spec_helper'

describe 'show drinks', js: true do 
  context 'database is preseeded with makeable drinks' do 
    before :all do 
      Ingredient.destroy_all
      Drink.destroy_all
      User.destroy_all

      @drink = FactoryGirl.create(:gin_tonic)

      @user = FactoryGirl.create(:user)

      [FactoryGirl.create(:ingredient2), FactoryGirl.create(:ingredient3)].each do |ing|
        @drink.ingredients << ing
        @user.ingredients << ing
      end

      @c1 = Component.first
      @c1.parts = 3
      @c1.save      

      @c2 = Component.last
      @c2.parts = 1
      @c2.save

      @gimlet = FactoryGirl.create(:gimlet)
      @gimlet.ingredients << Ingredient.first
      @gimlet.ingredients << FactoryGirl.create(:lime_juice)
    end

    after :all do 
      Ingredient.destroy_all
      Drink.destroy_all
      Component.destroy_all
      User.destroy_all
    end

    before :each do 
      user_login
    end

    it 'shows what drinks a user can make' do 
      within 'ul.drinks' do
        expect(page).to have_content 'Gin and tonic'
      end
    end

    it 'shows parts of each ingredient of a drink' do 
      within 'ul.drinks' do 
        expect(page).to have_content 'Parts: 3'
      end
    end

    it 'updates makeable drinks when a new ingredient added' do 
      input_new_ingredient('lime juice')

      within 'ul.drinks' do 
        expect(page).to have_content 'Gimlet'
      end
    end
  end
end