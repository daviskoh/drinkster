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

  after :each do
    User.destroy_all
  end

  it 'allows you sign up' do 
    post '/api/users', user_params, request_headers

    expect(response).to be_success

    expect(User.last.email).to eq('bob@bob.com')
  end
end