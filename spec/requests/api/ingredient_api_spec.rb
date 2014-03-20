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

    post "/api/users/#{response.body}/ingredients", ingredient_params, request_headers

    resp = JSON.parse response.body
    expect(resp['name']).to eq 'whiskey'
  end

  it 'allows you to add ingredient to personal list' do 
    api_login

    id = response.body

    post "/api/users/#{id}/ingredients", ingredient_params, request_headers

    expect(User.find(id).ingredients.last.name).to eq 'whiskey'
  end

  it 'denies unauthorized adding' do 
    add_ingredient

    expect(User.last).to have(0).ingredients
  end

  it 'allows you to remove an ingredient' do 

  end

  it 'denies unauthorized removing'
end