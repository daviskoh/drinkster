require 'spec_helper'

describe 'show drinks', js: true do 
  context 'database is preseed with makeable drinks' do 
    let!(:drink) { FactoryGirl.create(:gin_tonic) }
    let!(:gin) { FactoryGirl.create(:ingredient2) }
    let!(:tonic) { FactoryGirl.create(:ingredient3) }
    
    before :all do 
      @user = FactoryGirl.create(:user)
    end

    after :all do 
      Ingredient.destroy_all
      User.destroy_all
    end

    before :each do 
      drink.ingredients << gin
      drink.ingredients << tonic

      @user.ingredients << gin
      @user.ingredients << tonic

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