require 'spec_helper'

describe 'User API' do 
  before :each do
    Ingredient.destroy_all 
    User.destroy_all
    FactoryGirl.create :user
  end

  after :each do
    Ingredient.destroy_all 
    User.destroy_all
  end

  it 'allows you to add an ingredient' do 
    api_login

    post user_ingredients_path(response.body), ingredient_params, request_headers

    resp = JSON.parse response.body
    expect(resp['name']).to eq 'whiskey'
  end

  it 'allows you to add ingredient to personal list' do 
    api_login

    id = response.body

    add_ingredient(id)

    expect(User.find(id).ingredients.last.name).to eq 'whiskey'
  end

  it 'denies unauthorized adding' do 
    add_ingredient

    expect(User.last).to have(0).ingredients
  end

  it 'allows you to remove an ingredient' do 
    api_login

    add_ingredient

    remove_ingredient

    expect(User.last.ingredients.count).to eq 0
  end

  it 'does not remove ingredient from db' do 
    api_login

    add_ingredient

    remove_ingredient

    expect(Ingredient.count).to eq 1
  end

  it 'denies unauthorized removing' do 
    add_ingredient_manually # returns @user who now has an ingredient

    remove_ingredient

    expect(@user).to have(1).ingredients
  end

  it 'allows retrieval of a user\'s ingredients' do 
    api_login

    id = response.body

    add_ingredient

    get user_ingredients_path(id), {}, request_headers

    resp = JSON.parse(response.body)

    expect(resp).to have(1).ingredients
  end
end