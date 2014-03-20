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

  it 'allows you to add ingredient to personal list'

  it 'denies unauthorized adding'

  it 'allows you to remove an ingredient'

  it 'denies unauthorized removing'
end