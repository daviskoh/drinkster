require 'spec_helper'

describe 'User API' do 
  let(:user_params) { 
    { user: {
      email: 'bob@bob.com', password: 'bob', password_confirmation: 'bob'
      }
    }.to_json
  }

  before :each do 
    User.destroy_all
  end

  after :each do
    User.destroy_all
  end

  it 'allows you sign up' do 
    post '/api/users', user_params, request_headers

    expect(response).to be_success

    expect(User.last.email).to eq('bob@bob.com')
  end

  it 'allows retrieval of specific user info' do 
    FactoryGirl.create :user

    api_login
    get "/api/users/#{response.body}", {}, request_headers
    expect(response).to be_success

    resp = JSON.parse response.body
    expect(resp['email']).to eq('bob@bob.com')
  end

  it 'denies retrieval of specific user info' do 
    user = FactoryGirl.create :user

    get "/api/users/#{user.id}", {}, request_headers

    expect(response.status).to eq 401
  end
end