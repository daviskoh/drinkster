require 'spec_helper'

describe 'Drink API' do 
  before :all do 
    FactoryGirl.create(:gin_tonic)
    @user = FactoryGirl.create(:user)

    @user.ingredients << FactoryGirl.create(:ingredient2)
    @user.ingredients << FactoryGirl.create(:ingredient3)
  end

  after :all do 
    Ingredient.destroy_all 
    User.destroy_all
    Drink.destroy_all
  end

  it 'returns list of makeable drinks' do 
    api_login

    get user_drinks_path(@user.id), {}, request_headers

    resp = JSON.parse(response.body)

    expect(resp).to have(1).drink
  end

  it 'includes how much of each ingredient to make' do 
    
  end
end