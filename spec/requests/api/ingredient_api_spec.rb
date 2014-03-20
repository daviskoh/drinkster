require 'spec_helper'

describe 'User API' do 
  let(:request_headers) {
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  }

  let(:user_params) { 
    { user: {
      email: 'bob@bob.com', password: 'bob', password_confirmation: 'bob'
      }
    }.to_json
  }

  let(:login_params) { 
    { email: 'bob@bob.com', password: 'bob' }.to_json
  }

  let(:ingredient_params) {
    { ingredient: { name: 'whiskey' } }.to_json
  }

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
    post '/api/session', login_params, request_headers

    post "/api/users/#{response.body}/ingredients", ingredient_params, request_headers

    resp = JSON.parse response.body
    expect(resp['name']).to eq 'whiskey'
  end

  it 'allows you to add ingredient to personal list' do 
    post '/api/session', login_params, request_headers

    id = response.body

    post "/api/users/#{id}/ingredients", ingredient_params, request_headers

    expect(User.find(id).ingredients.last.name).to eq 'whiskey'
  end

  it 'denies unauthorized adding' do 
    post "/api/users/#{User.last.id}/ingredients", ingredient_params, request_headers

    expect(User.last).to have(0).ingredients
  end

  it 'allows you to remove an ingredient'

  it 'denies unauthorized removing'
end