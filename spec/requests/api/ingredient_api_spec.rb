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

    # post "/api/users/#{response.body}/ingredients", ingredient_params, request_headers
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

  it 'allows you to remove an ingredient' #do 
   #   api_login
   #   add_ingredient

   #   delete "/api/users/#{User.last}/ingredients/#{Ingredient.last.id}"
   # end

  it 'denies unauthorized removing'
end